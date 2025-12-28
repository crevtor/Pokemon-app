// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonQuery _$PokemonQueryFromJson(Map<String, dynamic> json) =>
    _PokemonQuery(
      searchTerm: json['searchTerm'] as String?,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$PokemonQueryToJson(_PokemonQuery instance) =>
    <String, dynamic>{
      'searchTerm': instance.searchTerm,
      'pageSize': instance.pageSize,
    };
