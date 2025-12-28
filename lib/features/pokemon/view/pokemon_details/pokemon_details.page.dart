import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:pokemon/core/view_models/export.view_models.dart';
import 'package:pokemon/core/models/export.models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PokemonDetailsPage extends HookConsumerWidget {
  const PokemonDetailsPage({super.key, required this.item});

  final PokemonListItem item;

  @override
  Widget build(BuildContext context, ref) {
    final _ = ref.watch(pokemonDetailsProvider(item.id));
    final headerSize = useState<Size>(Size.zero);

    return SwipeScaffold(
      backgroundColor: secondary450,
      useStartingOpacity: true,
      child: Stack(
        children: [
          ScrollUi(
            padding: EdgeInsets.only(top: headerSize.value.height + 20),
            child: Column(
              spacing: 51,
              children: [
                PokemonThumbnailUi(
                  imageUrl: item.spriteUrl ?? '',
                ),
                PokemonContentUi(item: item),
              ],
            ),
          ),
          GlassBackNavBar(
            widgetDimension: (value) => headerSize.value = value,
            useFadeAnimation: false,
            navBottomMargin: 0,
          ),
        ],
      ),
    );
  }
}
