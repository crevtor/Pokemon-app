import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_query.freezed.dart';
part 'pokemon_query.g.dart';

@freezed
abstract class PokemonQuery with _$PokemonQuery {
  const factory PokemonQuery({
    String? searchTerm,
    @Default(20) int pageSize,
  }) = _PokemonQuery;

  factory PokemonQuery.fromJson(Map<String, dynamic> json) =>
      _$PokemonQueryFromJson(json);

  const PokemonQuery._();

  bool get hasAnyFilter => (searchTerm != null && searchTerm!.isNotEmpty);
}