import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';


class PokemonThumbnailUi extends ConsumerWidget {
  const PokemonThumbnailUi({super.key,
    required this.imageUrl,
    this.color,
  });

  final String imageUrl;
  final Color? color;

  @override
  Widget build(BuildContext context, ref) {
    return BorderBoxUi(
      height: 284,
      shadowOffset: Offset(3.95, 7.47),
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 50, vertical: 42
        ),
        decoration: BoxDecoration(
          color: color ?? offWhiteBlue,
          borderRadius: BorderRadius.all(smallRadius12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SmartMedia.assetSvg(pokemonBallIcon),
            CachedLocalNetworkImage(
              url: imageUrl,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
