// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetail _$PokemonDetailFromJson(Map<String, dynamic> json) =>
    PokemonDetail(
      (json['id'] as num?)?.toInt(),
      (json['abilities'] as List<dynamic>?)
          ?.map((e) => AbilitySlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['baseExperience'] as num?)?.toInt(),
      json['cries'] == null
          ? null
          : Cries.fromJson(json['cries'] as Map<String, dynamic>),
      (json['forms'] as List<dynamic>?)
          ?.map((e) => NameUrl.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['gameIndices'] as List<dynamic>?)
          ?.map((e) => GameIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['height'] as num?)?.toDouble(),
      (json['weight'] as num?)?.toDouble(),
      json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      (json['types'] as List<dynamic>?)
          ?.map((e) => TypeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailToJson(PokemonDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'abilities': instance.abilities?.map((e) => e.toJson()).toList(),
      'baseExperience': instance.baseExperience,
      'cries': instance.cries?.toJson(),
      'forms': instance.forms?.map((e) => e.toJson()).toList(),
      'gameIndices': instance.gameIndices?.map((e) => e.toJson()).toList(),
      'height': instance.height,
      'weight': instance.weight,
      'sprites': instance.sprites?.toJson(),
      'types': instance.types?.map((e) => e.toJson()).toList(),
    };

_AbilitySlot _$AbilitySlotFromJson(Map<String, dynamic> json) => _AbilitySlot(
  ability: json['ability'] == null
      ? null
      : NamedUrl.fromJson(json['ability'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AbilitySlotToJson(_AbilitySlot instance) =>
    <String, dynamic>{'ability': instance.ability};

_NamedUrl _$NamedUrlFromJson(Map<String, dynamic> json) =>
    _NamedUrl(name: json['name'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$NamedUrlToJson(_NamedUrl instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};

_Cries _$CriesFromJson(Map<String, dynamic> json) => _Cries(
  latest: json['latest'] as String?,
  legacy: json['legacy'] as String?,
);

Map<String, dynamic> _$CriesToJson(_Cries instance) => <String, dynamic>{
  'latest': instance.latest,
  'legacy': instance.legacy,
};

_GameIndex _$GameIndexFromJson(Map<String, dynamic> json) => _GameIndex(
  gameIndex: (json['gameIndex'] as num?)?.toInt(),
  version: json['version'] == null
      ? null
      : NamedUrl.fromJson(json['version'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GameIndexToJson(_GameIndex instance) =>
    <String, dynamic>{
      'gameIndex': instance.gameIndex,
      'version': instance.version,
    };

_Sprites _$SpritesFromJson(Map<String, dynamic> json) => _Sprites(
  backDefault: json['backDefault'] as String?,
  backFemale: json['backFemale'] as String?,
  backShiny: json['backShiny'] as String?,
  backShinyFemale: json['backShinyFemale'] as String?,
  frontDefault: json['frontDefault'] as String?,
  frontFemale: json['frontFemale'] as String?,
  frontShiny: json['frontShiny'] as String?,
);

Map<String, dynamic> _$SpritesToJson(_Sprites instance) => <String, dynamic>{
  'backDefault': instance.backDefault,
  'backFemale': instance.backFemale,
  'backShiny': instance.backShiny,
  'backShinyFemale': instance.backShinyFemale,
  'frontDefault': instance.frontDefault,
  'frontFemale': instance.frontFemale,
  'frontShiny': instance.frontShiny,
};

_TypeSlot _$TypeSlotFromJson(Map<String, dynamic> json) => _TypeSlot(
  slot: (json['slot'] as num?)?.toInt(),
  type: json['type'] == null
      ? null
      : NamedUrl.fromJson(json['type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TypeSlotToJson(_TypeSlot instance) => <String, dynamic>{
  'slot': instance.slot,
  'type': instance.type,
};

_NameUrl _$NameUrlFromJson(Map<String, dynamic> json) =>
    _NameUrl(name: json['name'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$NameUrlToJson(_NameUrl instance) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
};
