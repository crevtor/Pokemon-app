import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'request_lock.provider.dart';
import 'package:pokemon/core/utils/export.utilities.dart';

typedef ApiFetchTask = Future<void> Function(CancelToken token);

/// Central helper: runs a cancel-aware task guarded by requestLockProvider.
/// - lockKey should be unique (e.g. 'prefetch:kyc' or 'notifier:kyc:trigger')
/// - Returns the same future if the lock is already active (callers will await same result).
Future<T> runExclusiveWithCancelFor<T>(
    Ref ref,
    String lockKey,
    Future<T> Function(CancelToken token) task, {
      bool showLogs = false,
    }) {
  debugLog('RunExclusive', 'requesting lock for $lockKey');
  // Pass positional args FIRST (key, task) then optional named args
  final future = ref.read(requestLockProvider.notifier)
      .runExclusiveWithCancel<T>(lockKey, (token) {
    debugLog('RunExclusive', 'task passed to RequestLock for $lockKey');
    return task(token);
  }, showLogs: showLogs);

  future.whenComplete(() {
    debugLog('RunExclusive', 'future completed for $lockKey');
  });

  return future;
}
