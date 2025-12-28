import 'package:pokemon/core/models/export.models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_api.g.dart';

@RestApi(baseUrl: '')
abstract class PokemonServiceClient {
  factory PokemonServiceClient(Dio dio, {String baseUrl}) =
  _PokemonServiceClient;

  @GET('pokemon')
  Future<PokemonListResponse?> fetchPokemonList(
      @Query('limit') int? limit,
  );

  @GET('pokemon/{pokemonId}')
  Future<PokemonDetail?> fetchPokemonDetails(
      @Path('pokemonId') String pokemonId,
  );
}
