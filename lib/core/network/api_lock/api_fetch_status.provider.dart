import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApiFetchStatusNotifier extends StateNotifier<Map<String, AsyncValue<void>>> {
  ApiFetchStatusNotifier(): super(const {});

  AsyncValue<void>? status(String key) => state[key];

  void setLoading(String key) {
    state = {...state, key: const AsyncValue.loading()};
  }

  void setData(String key) {
    state = {...state, key: const AsyncValue.data(null)};
  }

  void setError(String key, Object err, [StackTrace? st]) {
    state = {...state, key: AsyncValue.error(err, st ?? StackTrace.empty)};
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

final apiFetchStatusProvider = StateNotifierProvider<ApiFetchStatusNotifier, Map<String, AsyncValue<void>>>((ref) {
  return ApiFetchStatusNotifier();
});
