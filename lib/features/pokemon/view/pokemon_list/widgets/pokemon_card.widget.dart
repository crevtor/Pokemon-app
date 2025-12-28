import 'package:flutter/material.dart';
import 'package:pokemon/core/extensions/string.extension.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/core/models/export.models.dart';
import 'package:pokemon/routing/app_routes.dart';
import 'package:pokemon/routing/go_route.dart';

class PokemonCardUi extends ConsumerWidget {
  const PokemonCardUi({
    super.key,
    required this.item,
    this.animationOffset,
    this.animate = true,
  });

  final PokemonListItem item;
  final int? animationOffset;
  final bool animate;

  @override
  Widget build(BuildContext context, ref) {
    final card = Bounce(
      onTap: () {
        ref.read(routerProvider).pushNamed(
          getNameFromRoute(Routes.pokemonDetails),
          extra: item,
        );
      },
      child: Container(
        width: double.infinity,
        margin: baseViewPaddingBig,
        padding: baseViewAllPadding12,
        decoration: BoxDecoration(
          color: secondary500,
          border: Border.all(color: grayScale10),
          borderRadius: BorderRadius.all(smallRadius),
        ),
        child: Row(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(smallRadius),
              child: SizedBox(
                height: 78,
                width: 88,
                child: (item.spriteUrl?.isEmpty ?? true)
                    ? SizedBox.shrink()
                    : CachedLocalNetworkImage(
                  url: item.spriteUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextUi.otherInfoTitle(item.name?.capitalize ?? '...'),
                        ),
                      ),
                      SmartMedia.fadeAssetSvg(arrowFrontIcon,
                          width: 14, height: 14, color: charcoal450),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

    if (!animate) return card;

    return FadeInUpUi(
      animationOffset: animationOffset,
      child: card,
    );
  }
}

class PokemonListLoaderUi extends StatelessWidget {
  const PokemonListLoaderUi({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollUi(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          ...List.generate(6, (idx) {
            return Container(
              width: double.infinity,
              margin: baseViewPaddingBig,
              padding: baseViewAllPadding12,
              decoration: BoxDecoration(
                color: black170,
                borderRadius: BorderRadius.all(smallRadius),
              ),
              child: Row(
                spacing: 12,
                children: [
                  SizedBox(
                    height: 78,
                    width: 88,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: black200.withOpacity(0.8),
                        borderRadius: BorderRadius.all(smallRadius),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox(
                    height: 78,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: black200,
                        borderRadius: BorderRadius.all(smallRadius),
                      ),
                    ),
                  ),)
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
