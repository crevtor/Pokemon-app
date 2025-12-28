import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list.model.freezed.dart';
part 'pokemon_list.model.g.dart';


@JsonSerializable(explicitToJson: true)
class PokemonListResponse {
  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonListItem>? results;

  PokemonListResponse({
    this.count,
    this.next,
    this.previous,
    this.results
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);
}

@freezed
abstract class PokemonListItem with _$PokemonListItem {
  const factory PokemonListItem({
    String? name,
    String? url,
  }) = _PokemonListItem;

  factory PokemonListItem.fromJson(Map<String, dynamic> json) =>
      _$PokemonListItemFromJson(json);
}

/// Convenience helpers for PokemonListItem
extension PokemonListItemX on PokemonListItem {
  String? get id {
    final localUrl = url;
    if (localUrl == null) return null;
    final match = RegExp(r'/pokemon/(\d+)/?$').firstMatch(localUrl);
    if (match == null) return null;
    return match.group(1) ?? '';
  }

  String? get spriteUrl {
    final i = id;
    if (i == null) return null;
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$i.png';
  }
}
