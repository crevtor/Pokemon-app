import 'dart:collection';
import 'dart:async';
import 'package:pokemon/core/utils/export.utilities.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Holds set of currently running keys (for UI watching) and a map of in-flight Futures.
/// This version reserves an in-flight slot (via a Completer) *before* calling the task
/// to avoid race conditions where two callers both start the same task.

class RequestLockNotifier extends StateNotifier<Set<String>> {
  RequestLockNotifier() : super(<String>{});

  // Map of key -> in-flight future (publicly returned to callers)
  final Map<String, Future<dynamic>> _ongoing = {};

  /// key -> CancelToken (if runExclusiveWithCancel used)
  final Map<String, CancelToken> _cancelTokens = {};

  /// Whether a key is currently running (UI watches the notifier's state)
  bool isRunning(String key) => state.contains(key);

  /// Mark a key as running in the provider state (scheduled microtask to avoid Riverpod init-time mutation).
  void _markRunning(String key, {bool showLogs = false}) {
    Future.microtask(() {
      if (!state.contains(key)) {
        state = {...state, key};
        debugLog('RequestLock', 'marked running: ${state.toString()}', printLog: showLogs);
      }
    });
  }

  /// Run a task for `key` only once concurrently. If already running, returns the existing Future.
  /// This implementation reserves a Completer.Future in `_ongoing` before launching the task,
  /// guaranteeing subsequent callers will see an in-flight Future.
  Future<T> runExclusiveWithCancel<T>(
      String key,
      Future<T> Function(CancelToken token) task, {
        bool createTokenIfMissing = true,
        bool showLogs = false,
      }) {
    debugLog('RequestLock', 'Called for key: $key', printLog: showLogs);
    debugLog('RequestLock', 'current ongoing keys: ${_ongoing.keys.toList()}', printLog: showLogs);

    // If already have an in-flight Future, return a wrapper that casts the resolved value to T.
    if (_ongoing.containsKey(key)) {
      final existing = _ongoing[key]!;
      if (showLogs) {
        debugLog(
          'RequestLock',
          'returning existing future for $key (ongoing=${_ongoing.keys.length}) existing.runtimeType=${existing.runtimeType}',
          printLog: showLogs,
        );
      }

      return existing.then((value) {
        // At this point we cast the *value* to T.
        // If this cast fails, the returned future will complete with an error.
        return value as T;
      }) as Future<T>;
    }

    if (showLogs) {
      debugLog('RequestLock', 'starting new task for $key (createToken=$createTokenIfMissing)', printLog: showLogs);
    }

    // Reserve the slot immediately by storing a Completer.future. This prevents races.
    final completer = Completer<T>();
    _ongoing[key] = completer.future;

    // create new cancel token and store it if requested
    final cancelToken = CancelToken();
    if (createTokenIfMissing) {
      _cancelTokens[key] = cancelToken;
    }

    // mark running (for UI watchers). Do this after reserving _ongoing.
    _markRunning(key, showLogs: showLogs);

    // Run the actual task now.
    Future<T> taskFuture;
    try {
      taskFuture = task(cancelToken);
    } catch (syncErr, syncStack) {
      // If the task throws synchronously, complete the completer with error and cleanup.
      if (!completer.isCompleted) {
        completer.completeError(syncErr, syncStack);
      }
      // cleanup maps synchronously and rethrow
      _ongoing.remove(key);
      _cancelTokens.remove(key);
      Future.microtask(() {
        if (state.contains(key)) state = {...state}..remove(key);
      });
      rethrow;
    }

    // When the task completes, mirror its result to the completer and then cleanup.
    taskFuture.then((value) {
      if (!completer.isCompleted) completer.complete(value);
    }, onError: (e, st) {
      if (!completer.isCompleted) {
        if (st is StackTrace) {
          completer.completeError(e, st);
        } else {
          completer.completeError(e);
        }
      }
    }).whenComplete(() {
      if (showLogs) {
        debugLog('RequestLock', 'completed $key (cleaning up)', printLog: showLogs);
      }
      _ongoing.remove(key);
      _cancelTokens.remove(key);
      if (state.contains(key)) state = {...state}..remove(key);
      if (showLogs) {
        debugLog('RequestLock',
            'after cleanup running keys=${_ongoing.keys.toList()} state=${state.toString()}',
            printLog: showLogs);
      }
    });

    // Return the reserved future (completer.future) cast to expected type
    return _ongoing[key] as Future<T>;
  }

  /// Convenience for non-cancelable tasks: accepts a function with no token.
  Future<T> runExclusive<T>(String key, Future<T> Function() task, {bool showLogs = false}) {
    return runExclusiveWithCancel<T>(key, (_) => task(), createTokenIfMissing: false, showLogs: showLogs);
  }

  /// Cancel an in-flight request (if it has a token) and clear the lock.
  void forceCancel(String key, {String? reason}) {
    final token = _cancelTokens[key];
    if (token != null && !token.isCancelled) {
      debugLog('RequestLock', 'cancelling token for $key (reason=${reason ?? 'none'})');
      try {
        token.cancel(reason ?? 'Cancelled via RequestLockNotifier.forceCancel');
      } catch (_) {}
    } else {
      debugLog('RequestLock', 'forceCancel: no token found for $key');
    }
    _cancelTokens.remove(key);
    _ongoing.remove(key);
    if (state.contains(key)) {
      state = {...state}..remove(key);
    }
    debugLog('RequestLock', 'forceCancel done for $key; running keys=${_ongoing.keys.toList()}');
  }

  /// Force-clear a lock without cancelling token
  void forceClear(String key) {
    debugLog('RequestLock', 'forceClear called for $key (not cancelling token)');
    _cancelTokens.remove(key);
    _ongoing.remove(key);
    if (state.contains(key)) {
      state = {...state}..remove(key);
    }
    debugLog('RequestLock', 'forceClear done for $key; running keys=${_ongoing.keys.toList()}');
  }

  /// Cancel all in-flight requests and clear state.
  void forceCancelAll({String? reason}) {
    debugLog('RequestLock', 'forceCancelAll called (reason=${reason ?? 'none'})');
    final keys = _cancelTokens.keys.toList();
    for (final k in keys) {
      final token = _cancelTokens[k];
      if (token != null && !token.isCancelled) {
        debugLog('RequestLock', 'cancelling token for $k');
        try {
          token.cancel(reason ?? 'Cancelled via RequestLockNotifier.forceCancelAll');
        } catch (_) {}
      }
      _ongoing.remove(k);
      if (state.contains(k)) {
        state = {...state}..remove(k);
      }
    }
    _cancelTokens.clear();
    _ongoing.clear();
    state = {};
    debugLog('RequestLock', 'forceCancelAll complete; running keys cleared');
  }

  /// Clear all in-memory state but do not attempt to cancel tokens.
  void _clearStateSync() {
    _ongoing.clear();
    _cancelTokens.clear();
    state = {};
  }

  /// Graceful shutdown: cancel tokens and clear state.
  void disposeValues({String? reason}) {
    Future.microtask(() {
      debugLog('RequestLock', 'disposeValues called (reason=${reason ?? 'none'})');
      _cancelTokens.forEach((k, token) {
        try {
          if (!token.isCancelled) token.cancel(reason ?? 'Disposed via RequestLockNotifier.disposeValues');
        } catch (_) {}
      });
      _clearStateSync();
      debugLog('RequestLock', 'disposed: running keys cleared');
    });
  }

  /// Debug helpers
  List<String> get runningKeys => UnmodifiableListView(_ongoing.keys).toList();
  CancelToken? getCancelToken(String key) => _cancelTokens[key];
}

final requestLockProvider = StateNotifierProvider<RequestLockNotifier, Set<String>>((ref) {
  return RequestLockNotifier();
});
