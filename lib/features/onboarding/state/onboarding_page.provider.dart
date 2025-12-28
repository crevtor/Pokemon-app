import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPageNotifier extends StateNotifier<int> {
  OnboardingPageNotifier(): super(0);

  void setCurrentIndex(int index) {
    state = index;
  }

  static const List<Widget> onboardingSlides = [
    OnboardingContent(
      illustration: PokemonThumbnailUi(
        imageUrl: AppConstants.pikachuPokemon,
      ),
      child: Padding(
        padding: baseViewLeftPadding16,
        child: Text.rich(
          textAlign: TextAlign.left,
          TextSpan(
            text: 'Know everything\nabout',
            style: onBoardingTitle,
            children: [
              TextSpan(
                text: ' Pokemon\n',
                style: onBoardingSelectedTitle,
              ),
              TextSpan(
                text: 'and ',
                style: onBoardingTitle,
              ),
              TextSpan(
                text: 'Enjoy!',
                style: onBoardingSelectedTitle,
              ),
            ],
          ),
        ),
      ),
    ),
    OnboardingContent(
      illustration: PokemonThumbnailUi(
        imageUrl: AppConstants.dragonPokemon,
        color: lime,
      ),
      child: Padding(
        padding: baseViewLeftPadding16,
        child: Text.rich(
          textAlign: TextAlign.left,
          TextSpan(
            text: 'Create your own\n',
            style: onBoardingTitle,
            children: [
              TextSpan(
                text: ' Collection\n',
                style: onBoardingSelectedTitle,
              ),
            ],
          ),
        ),
      ),
    ),
  ];
}

final onboardingPageProvider =
StateNotifierProvider<OnboardingPageNotifier, int>((_) => OnboardingPageNotifier());
