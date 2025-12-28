import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pokemon/core/network/api_lock/export.api_lock.dart';
import 'package:pokemon/core/models/export.models.dart';


int apiCacheVersion = 2;

AutoDisposeFutureProvider<T?> createSavableApiProvider<T extends SavableModel>({
  required ApiFetchKey key,
  required Future<T?> Function(Ref ref, CancelToken token) networkCall,
  bool useCache = false,
  Duration? ttl,
  String? cacheKey,
  required T Function(Map<String, dynamic>) fromJson,
  bool showLogs = true,
  bool trackLogs = true,
  bool useDataNotifierLoader = false,
  bool saveToDataNotifier = true,
}) {
  final provider = FutureProvider.autoDispose<T?>((ref) async {
    return await fetchWithLockAndCacheSavable<T>(
      ref: ref,
      key: key,
      networkCall: (token) => networkCall(ref, token),
      useCache: useCache,
      ttl: ttl,
      cacheKey: cacheKey,
      cacheVersion: apiCacheVersion,
      fromJson: fromJson,
      useDataNotifierLoader: useDataNotifierLoader,
      saveToDataNotifier: saveToDataNotifier,
      showLogs: showLogs,
      trackLogs: trackLogs
    );
  });

  return provider;
}

/// Create a provider for JSON-generic responses
AutoDisposeFutureProvider<T?> createGenericApiProvider<T>({
  required ApiFetchKey key,
  required Future<T?> Function(Ref ref, CancelToken token) networkCall,
  required T Function(dynamic json) fromJson,
  required dynamic Function(T value) toJson,
  bool useCache = false,
  Duration? ttl,
  String? cacheKey,
  bool showLogs = true,
  bool trackLogs = true,
  bool useDataNotifierLoader = false,
  bool saveToDataNotifier = true,
  bool forceRefresh = true,
}) {
  final provider = FutureProvider.autoDispose<T?>((ref) async {
    return await fetchWithLockAndCacheGeneric<T>(
      ref: ref,
      key: key,
      networkCall: (token) => networkCall(ref, token),
      fromJson: fromJson,
      useDataNotifierLoader: useDataNotifierLoader,
      saveToDataNotifier: saveToDataNotifier,
      toJson: toJson,
      useCache: useCache,
      ttl: ttl,
      cacheKey: cacheKey,
      cacheVersion: apiCacheVersion,
      showLogs: showLogs,
      trackLogs: trackLogs,
      forceRefresh: forceRefresh
    );
  });

  return provider;
}

AutoDisposeFutureProviderFamily<T?, P> createGenericApiProviderFamily<T, P>({
  required ApiFetchKey key,
  /// The network call now receives (Ref ref, CancelToken token, P param)
  required Future<T?> Function(Ref ref, CancelToken token, P param) networkCall,
  required T Function(dynamic json) fromJson,
  required dynamic Function(T value) toJson,
  bool useCache = false,
  Duration? ttl,
  String? cacheKey, // base cache key (without param)
  bool showLogs = true,
  bool trackLogs = true,
  bool useDataNotifierLoader = false,
  bool saveToDataNotifier = true,
  bool forceRefresh = true,
  /// Builder to create cacheKey per param (if omitted uses
  /// "$cacheKey:${param.toString()}" or default)
  String Function(P param)? cacheKeyBuilder,
  /// Builder to create lock key per param
  String Function(P param)? lockKeyBuilder,
}) {
  return FutureProvider.autoDispose.family<T?, P>((ref, param) async {
    // compute keys that incorporate the param
    final effectiveCacheKey = cacheKeyBuilder != null
        ? '${cacheKeyBuilder(param)}:v$apiCacheVersion'
        : (cacheKey != null ? '$cacheKey:${param.toString()}:v$apiCacheVersion' :
    'api_cache:${key.id}:${param.toString()}:v$apiCacheVersion');

    final lockKey = lockKeyBuilder != null ? lockKeyBuilder(param) :
    '${key.id}:${param.toString().toUpperCase()}';

    // call fetch helper and pass lockKeyOverride and cacheKey
    return await fetchWithLockAndCacheGeneric<T>(
      ref: ref,
      key: key,
      networkCall: (token) => networkCall(ref, token, param),
      fromJson: fromJson,
      useDataNotifierLoader: useDataNotifierLoader,
      saveToDataNotifier: saveToDataNotifier,
      toJson: toJson,
      useCache: useCache,
      ttl: ttl,
      cacheKey: effectiveCacheKey,
      cacheVersion: apiCacheVersion,
      showLogs: showLogs,
      trackLogs: trackLogs,
      forceRefresh: forceRefresh,
      lockKeyOverride: lockKey, // <- important so locks are per param
    );
  });
}

AutoDisposeFutureProviderFamily<T?, P> createSavableApiProviderFamily<T extends SavableModel, P>({
  required ApiFetchKey key,
  required Future<T?> Function(Ref ref, CancelToken token, P param) networkCall,
  bool useCache = false,
  Duration? ttl,
  String? cacheKey,
  required T Function(Map<String, dynamic>) fromJson,
  bool showLogs = true,
  bool trackLogs = true,
  bool useDataNotifierLoader = false,
  bool saveToDataNotifier = true,
  String Function(P param)? cacheKeyBuilder,
  String Function(P param)? lockKeyBuilder,
}) {
  return FutureProvider.autoDispose.family<T?, P>((ref, param) async {
    final effectiveCacheKey = cacheKeyBuilder != null
        ? '${cacheKeyBuilder(param)}:v$apiCacheVersion'
        : (cacheKey != null ? '$cacheKey:${param.toString()}:v$apiCacheVersion'
        : 'api_cache:${key.id}:${param.toString()}:v$apiCacheVersion');

    final lockKey = lockKeyBuilder != null ? lockKeyBuilder(param) : '${key.id}:${param.toString()}';

    return await fetchWithLockAndCacheSavable<T>(
      ref: ref,
      key: key,
      networkCall: (token) => networkCall(ref, token, param),
      useCache: useCache,
      ttl: ttl,
      cacheKey: effectiveCacheKey,
      cacheVersion: apiCacheVersion,
      fromJson: fromJson,
      useDataNotifierLoader: useDataNotifierLoader,
      saveToDataNotifier: saveToDataNotifier,
      showLogs: showLogs,
      trackLogs: trackLogs,
      lockKeyOverride: lockKey, // if you added this param to savable helper
    );
  });
}
