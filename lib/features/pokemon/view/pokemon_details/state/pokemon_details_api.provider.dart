import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/core/models/export.models.dart';
import 'package:pokemon/core/network/apis/export.apis.dart';
import 'package:pokemon/core/network/api_lock/export.api_lock.dart';

final pokemonDetailsApiProvider = createGenericApiProviderFamily<
    PokemonDetail, String>(
  key: ApiFetchKey.pokemon,
  networkCall: (ref, token, id) {
    final svc = ref.read(pokemonRepositoryProvider);
    return svc.fetchPokemonDetails(pokemonId: id);
  },
  fromJson: (json) => PokemonDetail.fromJson(json as Map<String, dynamic>),
  toJson: (PokemonDetail x) => x.toJson(),
  useCache: true,
  cacheKeyBuilder: (String id) => 'api_cache:${ApiFetchKey.pokemon.idWith(param: id)}',
  lockKeyBuilder: (String id) => ApiFetchKey.pokemon.idWith(param: id),
);

/// Retry provider in case API call failed
final retryTriggerProvider = StateProvider.autoDispose<int>((ref) => 0);

/// Data stream
final pokemonDetailsProvider = Provider.autoDispose.family<
    AsyncValue<PokemonDetail?>, String?>((ref, id) {
  final keyId = ApiFetchKey.pokemon.idWith(param: id);
  ref.watch(getPokemonDetailsDataProvider(
    PokemonDetailsParams(id: id, retry: ref.watch(retryTriggerProvider)),
  ));
  final raw = ref.watch(requestDataProvider(keyId));
  return raw.when<AsyncValue<PokemonDetail?>>(
    data: (value) => AsyncValue.data(value as PokemonDetail?),
    loading: () => const AsyncValue<PokemonDetail?>.loading(),
    error: (err, st) => AsyncValue<PokemonDetail?>.error(err, st),
  );
});
