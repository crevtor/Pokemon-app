import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/core/extensions/export_extensions.dart';

part 'pokemon_detail.model.freezed.dart';
part 'pokemon_detail.model.g.dart';


@JsonSerializable(explicitToJson: true)
class PokemonDetail {
  final int? id;
  final List<AbilitySlot>? abilities;
  final int? baseExperience;
  final Cries? cries;
  final List<NameUrl>? forms;
  final List<GameIndex>? gameIndices;
  final double? height;
  final double? weight;
  final Sprites? sprites;
  final List<TypeSlot>? types;

  PokemonDetail(
      this.id,
      this.abilities,
      this.baseExperience,
      this.cries,
      this.forms,
      this.gameIndices,
      this.height,
      this.weight,
      this.sprites,
      this.types,
      );

  factory PokemonDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailToJson(this);
}

extension PokemonDetailX on PokemonDetail {
  List<String> get typeNames => types
      ?.map((t) => t.type?.name?.capitalize)
      .where((n) => n != null && n.isNotEmpty)
      .cast<String>()
      .toList() ?? [];

  List<String> get abilityNames => abilities
      ?.map((t) => t.ability?.name?.capitalize)
      .where((n) => n != null && n.isNotEmpty)
      .cast<String>()
      .toList() ?? [];
}

@freezed
abstract class AbilitySlot with _$AbilitySlot {
  const factory AbilitySlot({
    NamedUrl? ability,
  }) = _AbilitySlot;

  factory AbilitySlot.fromJson(Map<String, dynamic> json) =>
      _$AbilitySlotFromJson(json);
}

@freezed
abstract class NamedUrl with _$NamedUrl {
  const factory NamedUrl({
    required String? name,
    required String? url,
  }) = _NamedUrl;

  factory NamedUrl.fromJson(Map<String, dynamic> json) =>
      _$NamedUrlFromJson(json);
}

@freezed
abstract class Cries with _$Cries {
  const factory Cries({
    String? latest,
    String? legacy,
  }) = _Cries;

  factory Cries.fromJson(Map<String, dynamic> json) => _$CriesFromJson(json);
}

@freezed
abstract class GameIndex with _$GameIndex {
  const factory GameIndex({
    int? gameIndex,
    NamedUrl? version,
  }) = _GameIndex;

  factory GameIndex.fromJson(Map<String, dynamic> json) =>
      _$GameIndexFromJson(json);
}

@freezed
abstract class Sprites with _$Sprites {
  const factory Sprites({
    String? backDefault,
    String? backFemale,
    String? backShiny,
    String? backShinyFemale,
    String? frontDefault,
    String? frontFemale,
    String? frontShiny,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);
}

@freezed
abstract class TypeSlot with _$TypeSlot {
  const factory TypeSlot({
    int? slot,
    NamedUrl? type,
  }) = _TypeSlot;

  factory TypeSlot.fromJson(Map<String, dynamic> json) =>
      _$TypeSlotFromJson(json);
}

@freezed
abstract class NameUrl with _$NameUrl {
  const factory NameUrl({
    String? name,
    String? url,
  }) = _NameUrl;

  factory NameUrl.fromJson(Map<String, dynamic> json) =>
      _$NameUrlFromJson(json);
}