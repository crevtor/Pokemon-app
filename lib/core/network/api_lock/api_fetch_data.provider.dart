import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Stores the latest payload (AsyncValue) for each ApiFetchKey.
/// Value is dynamic because providers may return different DTO types.
class ApiFetchDataNotifier extends StateNotifier<Map<String, AsyncValue<dynamic>>> {
  ApiFetchDataNotifier() : super(const {});

  AsyncValue<dynamic>? getData(String key) => state[key];

  void setLoading(String key) {
    state = {...state, key: const AsyncValue.loading()};
  }

  void setData(String key, dynamic value) {
    state = {...state, key: AsyncValue.data(value)};
  }

  void setError(String key, Object error, [StackTrace? st]) {
    state = {...state, key: AsyncValue.error(error, st ?? StackTrace.empty)};
  }

  void clear(String key) {
    final newMap = {...state};
    newMap.remove(key);
    state = newMap;
  }

  void clearAll() => state = {};

  void disposeValues() {
    clearAll();
  }
}

final apiFetchDataProvider = StateNotifierProvider<ApiFetchDataNotifier, Map<String, AsyncValue<dynamic>>>((ref) {
  return ApiFetchDataNotifier();
});


/// --- helper provider to read stored API payload by ApiFetchKey ---
/// This returns the AsyncValue payload stored in apiFetchDataProvider map
/// (the same map updated by fetchWithLockAndCache* via dataNotifier.setData).
final requestDataProvider = Provider.family<AsyncValue<dynamic>, String>((ref, key) {
  final map = ref.watch(apiFetchDataProvider);
  return map[key] ?? const AsyncValue.data(null);
});