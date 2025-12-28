import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pokemon/core/network/api_lock/export.api_lock.dart';
import 'package:pokemon/core/services/local_storage.service.dart';
import 'package:pokemon/core/models/export.models.dart';
import 'package:pokemon/core/utils/export.utilities.dart';


void _scheduleStatusUpdate(void Function() fn) {
  Future.microtask(fn);
}

// Small cache helpers (string-based; used by generic path)
Future<String?> _readCacheString(String effectiveCacheKey) async {
  try {
    final raw = localStorageService.getFromDisk(effectiveCacheKey);
    if (raw is String && raw.isNotEmpty) return raw;
  } catch (_) {}
  return null;
}

Future<void> writeCacheString(String effectiveCacheKey, String jsonStr) async {
  try {
    await localStorageService.saveToDisk<String>(effectiveCacheKey, jsonStr);
  } catch (_) {}
}

/// Writes timestamp string next to cache
Future<void> writeCacheTimestamp(String tsKey) async {
  try {
    await localStorageService.saveToDisk<String>(
      tsKey,
      DateTime.now().millisecondsSinceEpoch.toString(),
    );
  } catch (_) {}
}

/// Generic JSON path: use when your model is NOT a SavableModel or you want
/// to pass custom fromJson/toJson functions.
Future<T?> fetchWithLockAndCacheGeneric<T>({
  required Ref ref,
  required ApiFetchKey key,
  required Future<T?> Function(CancelToken token) networkCall,
  required T Function(dynamic json) fromJson,
  required dynamic Function(T value) toJson,
  bool forceRefresh = false,
  bool useCache = false,
  bool showLogs = false,
  bool trackLogs = true,
  int cacheVersion = 1,
  Duration? ttl,
  String? cacheKey, // default will be 'api_cache:<key.id>'
  String? lockKeyOverride,
  bool useDataNotifierLoader = false,
  bool saveToDataNotifier = true,
}) async {
  final statusNotifier = ref.read(apiFetchStatusProvider.notifier);
  final dataNotifier = ref.read(apiFetchDataProvider.notifier);

  final lockKey = lockKeyOverride ?? key.id;
  final effectiveCacheKey = cacheKey ?? 'api_cache:${key.id}:v$cacheVersion';
  final tsKey = '$effectiveCacheKey:ts';
  const String fetchGeneric = 'FetchGeneric';
  const String cacheGeneric = 'CacheGeneric';

  debugLog(
    fetchGeneric,
    'key=$lockKey useCache=$useCache forceRefresh=$forceRefresh ttl=${ttl?.inSeconds}s cacheKey=$effectiveCacheKey',
    level: LogLevel.loading,
    printLog: showLogs,
    trackLog: trackLogs,
  );

  // -------------------------
  // Path A: useCache && forceRefresh:
  //   - read cached payload (no TTL)
  //   - immediately publish cached payload so UI can present stale data
  //   - mark loading
  //   - then continue to network refresh below
  // -------------------------
  if (useCache && forceRefresh) {
    try {
      final raw = localStorageService.getFromDisk(effectiveCacheKey);
      // debugLog('Cache','[$key] Cache data: $raw');
      if (raw is String) {
        try {
          final cachedParsed = fromJson(jsonDecode(raw));
          debugLog(cacheGeneric,
              'forceRefresh: returned cached payload for $lockKey (will refresh from network)',
              level: LogLevel.info,
              printLog: showLogs,
              trackLog: trackLogs);

          _scheduleStatusUpdate(() {
            dataNotifier.setData(lockKey, cachedParsed);
            statusNotifier.setLoading(lockKey);
          });
        } catch (e, st) {
          // If parsing fails, just mark loading and continue to network
          debugLog(cacheGeneric,
              'forceRefresh: cached parse failed for $lockKey (will still call network): $e\n$st',
              level: LogLevel.warn,
              printLog: showLogs,
              trackLog: trackLogs);
          _scheduleStatusUpdate(() {
            if (useDataNotifierLoader) dataNotifier.setLoading(lockKey);
            statusNotifier.setLoading(lockKey);
          });
        }
      } else {
        // no cached entry found
        debugLog(cacheGeneric,
            'forceRefresh: no cached entry for $effectiveCacheKey (will call network)',
            level: LogLevel.info,
            printLog: showLogs,
            trackLog: trackLogs);
        _scheduleStatusUpdate(() {
          if (useDataNotifierLoader) dataNotifier.setLoading(lockKey);
          statusNotifier.setLoading(lockKey);
        });
      }
    } catch (e, st) {
      debugLog(cacheGeneric,
          'forceRefresh: cache read failed for $lockKey (will call network): $e\n$st',
          level: LogLevel.error,
          printLog: showLogs,
          trackLog: trackLogs);
      _scheduleStatusUpdate(() {
        if (useDataNotifierLoader) dataNotifier.setLoading(lockKey);
        statusNotifier.setLoading(lockKey);
      });
    }
  }
  else {
    // -------------------------
    // Path B: normal cache usage (useCache && !forceRefresh)
    //   - if cached value exists and TTL valid -> return it immediately
    //   - otherwise fallthrough to network
    // -------------------------
    if (useCache && !forceRefresh && saveToDataNotifier) {
      try {
        final raw = await _readCacheString(effectiveCacheKey);
        final tsRaw = localStorageService.getFromDisk(tsKey);
        if (raw is String) {
          debugLog('Cache', 'found raw entry for $effectiveCacheKey', trackLog: trackLogs, printLog: showLogs);
          if (ttl != null && tsRaw != null) {
            try {
              final ts = DateTime.fromMillisecondsSinceEpoch(int.parse(tsRaw.toString()));
              final age = DateTime.now().difference(ts);
              if (age <= ttl) {
                final parsed = fromJson(jsonDecode(raw));
                debugLog(cacheGeneric,
                    'hit (fresh) for $lockKey — age=${age.inSeconds}s <= ttl=${ttl.inSeconds}s',
                    level: LogLevel.success,
                    printLog: showLogs,
                    trackLog: trackLogs);

                _scheduleStatusUpdate(() {
                  statusNotifier.setData(lockKey);
                  dataNotifier.setData(lockKey, parsed);
                });
                return parsed;
              } else {
                debugLog(cacheGeneric,
                    'expired for $lockKey — age=${age.inSeconds}s > ttl=${ttl.inSeconds}s (fallthrough to network)',
                    level: LogLevel.expired,
                    printLog: showLogs,
                    trackLog: trackLogs);
                // fallthrough to network
              }
            } catch (e, st) {
              debugLog(cacheGeneric,
                  'timestamp parse failed for $lockKey (will fallthrough): $e\n$st',
                  level: LogLevel.warn,
                  printLog: showLogs,
                  trackLog: trackLogs);
              // fallthrough to network
            }
          } else {
            // no TTL -> treat cached as always valid
            final parsed = fromJson(jsonDecode(raw));
            debugLog(cacheGeneric, 'hit (no-ttl) for $lockKey — returning cached value',
                level: LogLevel.success, printLog: showLogs, trackLog: trackLogs);
            _scheduleStatusUpdate(() {
              statusNotifier.setData(lockKey);
              dataNotifier.setData(lockKey, parsed);
            });
            return parsed;
          }
        } else {
          debugLog(cacheGeneric,
              'no entry for $effectiveCacheKey (raw is null or not string)',
              trackLog: trackLogs,
              printLog: showLogs);
        }
      } catch (e, st) {
        debugLog(cacheGeneric, 'cache read failed for $lockKey: $e\n$st',
            level: LogLevel.error, printLog: showLogs, trackLog: trackLogs);
        // continue to network
      }
    } else {
      // not using cache at all
      debugLog(cacheGeneric,
          'skipped cache for $lockKey (useCache=$useCache, forceRefresh=$forceRefresh)',
          level: LogLevel.skip,
          printLog: showLogs,
          trackLog: trackLogs);
    }

    // Ensure UI shows loading when we are about to call network (if not already).
    _scheduleStatusUpdate(() {
      if (useDataNotifierLoader) dataNotifier.setLoading(lockKey);
      statusNotifier.setLoading(lockKey);
    });
  }

  // -------------------------
  // Network call via lock (shared for both flows)
  // -------------------------
  debugLog(fetchGeneric, 'setLoading $key — calling network via lock $lockKey',
      level: LogLevel.loading, printLog: showLogs, trackLog: trackLogs);

  try {
    debugLog(fetchGeneric,
        'running exclusive network task for $key (lock=$lockKey)',
        level: LogLevel.running,
        printLog: showLogs,
        trackLog: trackLogs);

    final T? result = await runExclusiveWithCancelFor<T?>(ref, lockKey, (cancelToken) async {
      debugLog('Network', 'starting call for $key (lock=$lockKey)',
          level: LogLevel.initiate, printLog: showLogs, trackLog: trackLogs);
      final r = await networkCall(cancelToken);
      debugLog('Network', 'call complete for $key (lock=$lockKey)',
          level: LogLevel.finish, printLog: showLogs, trackLog: trackLogs);
      return r;
    }, showLogs: showLogs);

    // persist if requested and result not-null
    if (useCache && result != null && saveToDataNotifier) {
      try {
        final jsonStr = jsonEncode(toJson(result));
        await writeCacheString(effectiveCacheKey, jsonStr);
        await writeCacheTimestamp(tsKey);
        _scheduleStatusUpdate(() {
          statusNotifier.setData(lockKey);
          dataNotifier.setData(lockKey, result);
        });
        debugLog(cacheGeneric, 'write success for $effectiveCacheKey (key=$lockKey)',
            level: LogLevel.save, printLog: showLogs, trackLog: trackLogs);
      } catch (e, st) {
        debugLog(cacheGeneric, 'cache write failed for $lockKey: $e\n$st',
            level: LogLevel.error, printLog: showLogs, trackLog: trackLogs);
      }
    } else if(!useCache && result != null) {
        _scheduleStatusUpdate(() {
          statusNotifier.setData(lockKey);
          if(saveToDataNotifier) {
            dataNotifier.setData(lockKey, result);
          }
        });
      if (useCache) {
        debugLog(cacheGeneric, 'not writing (result is null) for $lockKey',
            level: LogLevel.sleep, printLog: showLogs, trackLog: trackLogs);
      }
    } else if (useCache) {}

    // publish final payload + status
    _scheduleStatusUpdate(() {
      statusNotifier.setData(lockKey);
      if (saveToDataNotifier) {
        dataNotifier.setData(lockKey, result);
      }
    });

    debugLog(fetchGeneric, 'setData $lockKey — returning network result',
        level: LogLevel.success, printLog: showLogs, trackLog: trackLogs);

    return result;
  } on DioException catch (dioErr) {
    // Cancelled -> mark cancelled and rethrow
    if (dioErr.type == DioExceptionType.cancel) {
      _scheduleStatusUpdate(() {
        statusNotifier.setError(lockKey, 'Cancelled', dioErr.stackTrace);
        dataNotifier.setError(lockKey, 'Cancelled', dioErr.stackTrace);
      });
      debugLog(fetchGeneric,
          'cancelled for $lockKey: ${dioErr.message} (${dioErr.stackTrace})',
          level: LogLevel.cancel,
          printLog: showLogs,
          trackLog: trackLogs);
      rethrow;
    }

    // Other Dio errors
    _scheduleStatusUpdate(() {
      statusNotifier.setError(lockKey, dioErr, dioErr.stackTrace);
      dataNotifier.setError(lockKey, dioErr, dioErr.stackTrace);
    });
    debugLog(fetchGeneric,
        'Dio Error $lockKey: ${dioErr.message} (${dioErr.stackTrace})',
        level: LogLevel.warn,
        printLog: showLogs,
        trackLog: trackLogs);
    rethrow;
  } catch (e, st) {
    _scheduleStatusUpdate(() {
      statusNotifier.setError(lockKey, e, st);
      dataNotifier.setError(lockKey, e, st);
    });
    debugLog(fetchGeneric, 'Error $lockKey: $e\n$st',
        level: LogLevel.error, printLog: showLogs, trackLog: trackLogs);
    rethrow;
  }
}

/// Convenience for types that implement SavableModel (your DTOs).
/// Uses LocalStorageService.saveModel / getSavedModel so you don't need to
/// re-serialize manually.
Future<T?> fetchWithLockAndCacheSavable<T extends SavableModel>({
  required Ref ref,
  required ApiFetchKey key,
  required Future<T?> Function(CancelToken token) networkCall,
  bool forceRefresh = false,
  bool useCache = false,
  bool showLogs = false,
  bool trackLogs = true,
  int cacheVersion = 1,
  Duration? ttl,
  String? cacheKey,
  String? lockKeyOverride,
  required T Function(Map<String, dynamic>) fromJson,
  bool useDataNotifierLoader = false,
  bool saveToDataNotifier = true,
}) async {
  final statusNotifier = ref.read(apiFetchStatusProvider.notifier);
  final dataNotifier = ref.read(apiFetchDataProvider.notifier);

  final lockKey = lockKeyOverride ?? key.id;
  final effectiveCacheKey = cacheKey ?? 'api_cache:${key.id}:v$cacheVersion';
  final tsKey = '$effectiveCacheKey:ts';
  const String fetchSavable = 'FetchSavable';
  const String cacheSavable = 'CacheSavable';

  debugLog(fetchSavable,
      'key=$lockKey useCache=$useCache forceRefresh=$forceRefresh ttl=${ttl?.inSeconds} cacheKey=$effectiveCacheKey saveDataNotifier=$saveToDataNotifier',
      level: LogLevel.loading,
      printLog: showLogs,
      trackLog: trackLogs);

  if (useCache && forceRefresh && saveToDataNotifier) {
    try {
      final cached = localStorageService.getSavedModel<T>(effectiveCacheKey, fromJson);
      if (cached != null) {
        _scheduleStatusUpdate(() {
          dataNotifier.setData(lockKey, cached);
          statusNotifier.setLoading(lockKey);
        });
      } else {
        _scheduleStatusUpdate(() {
          if (useDataNotifierLoader) dataNotifier.setLoading(lockKey);
          statusNotifier.setLoading(lockKey);
        });
      }
    } catch (e, st) {
      _scheduleStatusUpdate(() {
        if (useDataNotifierLoader) dataNotifier.setLoading(lockKey);
        statusNotifier.setLoading(lockKey);
      });
    }
  } else {
    if (useCache && !forceRefresh && saveToDataNotifier) {
      try {
        final cached = localStorageService.getSavedModel<T>(effectiveCacheKey, fromJson);
        final tsRaw = localStorageService.getFromDisk(tsKey);
        if (cached != null) {
          if (ttl != null && tsRaw != null) {
            try {
              final ts = DateTime.fromMillisecondsSinceEpoch(int.parse(tsRaw.toString()));
              final age = DateTime.now().difference(ts);
              if (age <= ttl) {
                _scheduleStatusUpdate(() {
                  statusNotifier.setData(lockKey);
                  dataNotifier.setData(lockKey, cached);
                });
                return cached;
              }
            } catch (e, st) {}
          } else {
            _scheduleStatusUpdate(() {
              statusNotifier.setData(lockKey);
              dataNotifier.setData(lockKey, cached);
            });
            return cached;
          }
        }
      } catch (e, st) {}
    } else {
      // skipped cache
    }

    _scheduleStatusUpdate(() {
      if (useDataNotifierLoader) dataNotifier.setLoading(lockKey);
      statusNotifier.setLoading(lockKey);
    });
  }

  try {
    final T? result = await runExclusiveWithCancelFor<T?>(ref, lockKey, (cancelToken) async {
      final r = await networkCall(cancelToken);
      return r;
    }, showLogs: showLogs);

    if (useCache && result != null && saveToDataNotifier) {
      try {
        await localStorageService.saveModel<T>(effectiveCacheKey, result);
        await writeCacheTimestamp(tsKey);
      } catch (e, st) {}
    } else {
      if (!saveToDataNotifier && useCache) {
        debugLog(cacheSavable, 'skipping internal cache write because useDataNotifier==false', printLog: showLogs, trackLog: trackLogs);
      }
    }

    _scheduleStatusUpdate(() {
      statusNotifier.setData(lockKey);
      if (saveToDataNotifier) dataNotifier.setData(lockKey, result);
    });

    return result;
  } on DioException catch (dioErr) {
    if (dioErr.type == DioExceptionType.cancel) {
      _scheduleStatusUpdate(() {
        statusNotifier.setError(lockKey, 'Cancelled', dioErr.stackTrace);
        dataNotifier.setError(lockKey, 'Cancelled', dioErr.stackTrace);
      });
      rethrow;
    }
    _scheduleStatusUpdate(() {
      statusNotifier.setError(lockKey, dioErr, dioErr.stackTrace);
      dataNotifier.setError(lockKey, dioErr, dioErr.stackTrace);
    });
    rethrow;
  } catch (e, st) {
    _scheduleStatusUpdate(() {
      statusNotifier.setError(lockKey, e, st);
      dataNotifier.setError(lockKey, e, st);
    });
    rethrow;
  }
}
