import 'package:pokemon/core/network/api_provider/export_api_provider.dart';
import 'package:pokemon/core/network/apis/export.apis.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dependency_state.g.dart';

@Riverpod(keepAlive: true)
PokemonServiceClient pokemonService(Ref ref) {
  final dio = ref.watch(networkProvider).dio;
  return PokemonServiceClient(dio);
}

@riverpod
PokemonRepo pokemonRepository(Ref ref) {
  final serviceClient = ref.watch(pokemonServiceProvider);
  return PokemonRepoImpl(serviceClient);
}
