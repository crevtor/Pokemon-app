import 'package:pokemon/core/models/export.models.dart';
import 'package:pokemon/core/network/apis/export.apis.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:flutter/foundation.dart';


class PokemonRepoImpl implements PokemonRepo {
  final PokemonServiceClient _apiServiceClient;

  PokemonRepoImpl(this._apiServiceClient);

  @override
  Future<PokemonListResponse?> fetchPokemonList(
      {int? limit}) async {
    try {
      final result = await _apiServiceClient.fetchPokemonList(
        limit
      );
      if (result != null) {
        return result;
      } else {
        throw AppConstants.unknownError;
      }
    } catch (e) {
      debugPrint(e.toString());
      throw ErrorHandler.handle(e).failure.message;
    }
  }

  @override
  Future<PokemonDetail?> fetchPokemonDetails(
      {
        required String pokemonId
      }) async {
    try {
      final result = await _apiServiceClient.fetchPokemonDetails(
          pokemonId);
      if (result != null) {
        return result;
      } else {
        throw AppConstants.unknownError;
      }
    } catch (e) {
      debugPrint(e.toString());
      throw ErrorHandler.handle(e).failure.message;
    }
  }
}
