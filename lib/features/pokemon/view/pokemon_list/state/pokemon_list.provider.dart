import 'dart:async';
import 'dart:convert';
import 'package:pokemon/core/view_models/export.view_models.dart';
import 'package:pokemon/core/network/api_lock/export.api_lock.dart';
import 'package:pokemon/core/models/export.models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list.provider.g.dart';

@riverpod
class PokemonListNotifier extends _$PokemonListNotifier {
  static const _firstPage = 1;
  static const int _pageSizeIncrement = 20;

  static String apiLockKey = ApiFetchKey.pokemon.idWith();

  bool _hasMore = true;
  int _nextPage = _firstPage;

  bool get hasMore => _hasMore;
  int get nextPage => _nextPage;

  // small guard to prevent concurrent loadMore calls / increments
  bool _isLoading = false;

  @override
  FutureOr<void> build() async {
    ref.keepAlive();

    final effectiveCacheKey = 'api_cache:$apiLockKey:v$apiCacheVersion';
    final tsKey = '$effectiveCacheKey:ts';

    final filters = ref.watch(pokemonListFiltersProvider);
    final dataNotifier = ref.read(apiFetchDataProvider.notifier);

    // reset pagination
    _hasMore = true;
    _nextPage = _firstPage;

    final query = filters;
    final req = PokemonListPageRequest(query: query, page: _firstPage);

    // initial page fetch using the current filters pageSize.
    final pageData = await ref.read(pokemonListApiProvider(req).future);
    final items = pageData?.results ?? const <PokemonListItem>[];
    final count = pageData?.count; // nullable

    // Determine if there are more pages to fetch.
    _hasMore = (count != null) ? (count > items.length) : (pageData?.next != null);
    _nextPage = _hasMore ? _firstPage + 1 : 0;

    // Update central store (apiFetchData)
    final result = PokemonListResponse(
      results: items,
      count: count,
      next: pageData?.next,
      previous: pageData?.previous,
    );

    dataNotifier.setData(apiLockKey, result);

    // persist cache
    final jsonStr = jsonEncode(result.toJson());
    await writeCacheString(effectiveCacheKey, jsonStr);
    await writeCacheTimestamp(tsKey);

    _isLoading = false;
  }

  Future<void> loadMore() async {
    if (!_hasMore || _nextPage == 0) return;

    if (_isLoading) return;

    final filters = ref.read(pokemonListFiltersProvider);
    final currentPageSize = filters.pageSize;

    // Determine remaining count if available
    final rawReqData = ref.read(requestDataProvider(apiLockKey));
    PokemonListResponse? currentResponse;
    currentResponse = rawReqData.valueOrNull as PokemonListResponse?;

    final totalCount = currentResponse?.count;
    final currentLoaded = currentResponse?.results?.length ?? 0;

    // If count is known, compute remaining and adjust increment if needed
    int increment = _pageSizeIncrement;
    if (totalCount != null) {
      final remaining = totalCount - currentLoaded;
      if (remaining <= 0) {
        // nothing left
        _hasMore = false;
        _nextPage = 0;
        return;
      }
      if (remaining < increment) increment = remaining;
    }

    final newPageSize = currentPageSize + increment;

    _isLoading = true;
    try {
      ref.read(pokemonListFiltersProvider.notifier).setPageSize(newPageSize);
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
  }

  void disposeValues() {
    _hasMore = true;
    _nextPage = _firstPage;
    _isLoading = false;
  }
}


@riverpod
class PokemonListFilters extends _$PokemonListFilters {
  @override
  PokemonQuery build() {
    // Sensible defaults here
    return PokemonQuery(
      pageSize: 20,
    );
  }

  static const int _minSearchChars = 2;

  void setPageSize(int value) => state = state.copyWith(pageSize: value);

  void setSearchTerm(String? raw) {
    final val = (raw ?? '').trim();
    final String? newSearch = val.isEmpty ? null : val;

    // Ignore very short queries
    if (newSearch != null && newSearch.length < _minSearchChars) {

    }

    state = state.copyWith(
      searchTerm: newSearch,
    );
  }

  void applyFilters({
    int? pageSize,
    String? searchTerm,
  }) {
    state = state.copyWith(
      pageSize: pageSize ?? state.pageSize,
      searchTerm: searchTerm ?? state.searchTerm,
    );
  }

  void reset() => state = const PokemonQuery();
}
