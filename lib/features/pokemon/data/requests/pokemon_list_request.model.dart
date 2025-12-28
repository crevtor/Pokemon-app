import 'package:pokemon/core/models/export.models.dart';

class PokemonListPageRequest {
  final PokemonQuery query;
  final int page;

  PokemonListPageRequest({required this.query, required this.page});

  @override
  String toString() => 'PokemonListPageRequest(page:$page, query:$query)';
}