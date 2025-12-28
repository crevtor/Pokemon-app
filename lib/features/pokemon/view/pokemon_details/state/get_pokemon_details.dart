import 'package:pokemon/core/view_models/export.view_models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_details.g.dart';

class PokemonDetailsParams {
  final String? id;
  final int retry;

  const PokemonDetailsParams({required this.id, required this.retry});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonDetailsParams &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          retry == other.retry;

  @override
  int get hashCode => id.hashCode ^ retry.hashCode;
}

@riverpod
Future<void> getPokemonDetailsData(
    Ref ref, PokemonDetailsParams params) async {
  final id = params.id;
  if (id == null) return;
  if (id.isEmpty) return;
  await ref.read(pokemonDetailsApiProvider(id).future);
}
