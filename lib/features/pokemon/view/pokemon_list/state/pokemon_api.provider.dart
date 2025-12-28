import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/core/models/export.models.dart';
import 'package:pokemon/core/network/apis/export.apis.dart';
import 'package:pokemon/core/view_models/export.view_models.dart';
import 'package:pokemon/core/network/api_lock/export.api_lock.dart';

final pokemonListApiProvider = createGenericApiProviderFamily<
    PokemonListResponse, PokemonListPageRequest>(
  key: ApiFetchKey.pokemon,
  networkCall: (ref, token, req) {
    final q = req.query;
    final svc = ref.read(pokemonRepositoryProvider);
    return svc.fetchPokemonList(
      limit: q.pageSize
    );
  },
  fromJson: (json) => PokemonListResponse.fromJson(json as Map<String, dynamic>),
  toJson: (PokemonListResponse x) => x.toJson(),
  useCache: true,
  saveToDataNotifier: false,
  cacheKeyBuilder: (PokemonListPageRequest req) =>
  'api_cache:${ApiFetchKey.pokemon.idWith()}',
  lockKeyBuilder: (PokemonListPageRequest req) => ApiFetchKey.pokemon.idWith(),
);

final pokemonListProvider = Provider.autoDispose<AsyncValue<PokemonListResponse?>>((ref) {
  final id = ApiFetchKey.pokemon.idWith();
  ref.watch(pokemonListNotifierProvider);
  final raw = ref.watch(requestDataProvider(id));
  return raw.when<AsyncValue<PokemonListResponse?>>(
    data: (value) => AsyncValue.data(value as PokemonListResponse?),
    loading: () => const AsyncValue<PokemonListResponse?>.loading(),
    error: (err, st) => AsyncValue<PokemonListResponse?>.error(err, st),
  );
});

final pokemonListLastAnimatedCountProvider = StateProvider<int>((ref) => 0);