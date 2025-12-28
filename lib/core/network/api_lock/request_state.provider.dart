import 'package:pokemon/core/utils/debug_log.utils.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/core/network/api_lock/export.api_lock.dart';

/// A simple DTO representing the resolved request state, now including payload.
class RequestState {
  final bool isLoading;
  final bool isLocked;
  final bool hasData;
  final Object? error;
  final AsyncValue<void>? statusAsync; // existing status map value
  final AsyncValue<dynamic>? data;     // payload (can be AsyncLoading/AsyncData/AsyncError)

  const RequestState({
    required this.isLoading,
    required this.isLocked,
    required this.hasData,
    this.error,
    this.statusAsync,
    this.data,
  });

  bool get isError => error != null;

  @override
  String toString() {
    return 'RequestState(isLoading: $isLoading, isLocked: $isLocked, hasData: $hasData, error: $error, data: ${data?.toString()})';
  }
}

/// Parameters for requestStateProvider.
///
/// NOTE: `key` is a **string id** (the dynamic id used throughout the
/// api-fetch system). Example values:
///   - 'fetch:kyc'
///   - 'fetch:rwaCurrencyBalance:gold'
///
/// For backward compatibility you can construct via:
///   RequestStateParams.fromApiFetchKey(ApiFetchKey.kyc)
class RequestStateParams {
  /// **String id** used as the map key in apiFetchDataProvider / apiFetchStatusProvider.
  final String key;

  /// Optional fallback provider to watch (used to infer loading when status map is
  /// not set). Can be any `ProviderBase`.
  final ProviderBase? fallbackProvider;

  /// Optional custom function to interpret fallback provider's value as "loading".
  final bool Function(dynamic value)? fallbackIsLoading;

  const RequestStateParams({
    required this.key,
    this.fallbackProvider,
    this.fallbackIsLoading,
  });

  /// Convenience to create params from an ApiFetchKey (keeps migration simple).
  RequestStateParams.fromApiFetchKey(
      ApiFetchKey apiKey, {
        ProviderBase? fallbackProvider,
        bool Function(dynamic value)? fallbackIsLoading,
      }) : this(
    key: apiKey.id,
    fallbackProvider: fallbackProvider,
    fallbackIsLoading: fallbackIsLoading,
  );
}

/// Now watches both apiFetchStatusProvider and apiFetchDataProvider as well as requestLockProvider.
final requestStateProvider = Provider.family<RequestState, RequestStateParams>((ref, params) {
  // Watch the map of prefetch statuses and the set of running locks.
  // Note: apiFetchStatusProvider and apiFetchDataProvider now use String keys.
  final Map<String, AsyncValue<void>> statusMap = ref.watch(apiFetchStatusProvider);
  final Set<String> locks = ref.watch(requestLockProvider);
  final Map<String, AsyncValue<dynamic>> dataMap = ref.watch(apiFetchDataProvider);

  final String asyncKey = params.key;

  // lookup values (might be null)
  final AsyncValue<void>? asyncVal = statusMap[asyncKey];
  final AsyncValue<dynamic>? payloadVal = dataMap[asyncKey];

  // lock check
  final bool isLockRunning = locks.contains(asyncKey);

  debugLog('RequestState', 'Is lock running: $isLockRunning');

  // Derive loading from status AsyncValue if present
  final bool isLoadingFromStatus = asyncVal?.when(
    data: (_) => false,
    loading: () => true,
    error: (_, __) => false,
  ) ??
      false;

  // Optionally consult fallback provider
  bool fallbackLoading = false;
  try {
    if (params.fallbackProvider != null) {
      final dyn = ref.watch(params.fallbackProvider as ProviderBase<dynamic>);

      if (params.fallbackIsLoading != null) {
        fallbackLoading = params.fallbackIsLoading!(dyn);
      } else if (dyn is bool) {
        fallbackLoading = dyn;
      } else if (dyn is AsyncValue) {
        fallbackLoading = dyn.when(
          data: (_) => false,
          loading: () => true,
          error: (_, __) => false,
        );
      } else {
        fallbackLoading = false;
      }
    }
  } catch (e, st) {
    if (kDebugMode) debugPrint('requestStateProvider: fallbackProvider watch failed: $e\n$st');
    fallbackLoading = false;
  }

  final bool isLoading = isLoadingFromStatus || isLockRunning || fallbackLoading;

  // Determine whether we have payload data: data AsyncData with non-null value is typical.
  final bool hasData = payloadVal is AsyncData && payloadVal.value != null;
  final Object? error = (payloadVal is AsyncError)
      ? payloadVal.error
      : (asyncVal is AsyncError ? asyncVal.error : null);

  return RequestState(
    isLoading: isLoading,
    isLocked: isLockRunning,
    hasData: hasData,
    error: error,
    statusAsync: asyncVal,
    data: payloadVal,
  );
});
