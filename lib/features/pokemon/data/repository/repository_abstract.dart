import 'package:pokemon/core/models/export.models.dart';

abstract class PokemonRepo {
  Future<PokemonListResponse?> fetchPokemonList({
    int? limit,
  });

  Future<PokemonDetail?> fetchPokemonDetails({
    required String pokemonId
  });
}
