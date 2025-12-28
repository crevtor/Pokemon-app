import 'dart:io';
import 'package:flutter/material.dart';

import 'package:dismissible_page/dismissible_page.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:pokemon/core/view_models/export.view_models.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPageUi extends HookConsumerWidget {
  const OnboardingPageUi({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pageController = usePageController();

    return SwipeScaffold(
      backgroundColor: secondary450,
      dismissDirection: DismissiblePageDismissDirection.none,
      child: SafeArea(
        top: false,
        bottom: Platform.isAndroid ? true : false,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: OnboardingPageNotifier.onboardingSlides,
            ),
            AppLogoUi(),
            OnboardingCta(),
            Positioned(
              bottom: 373,
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: PillDotPageIndicator(
                  count: OnboardingPageNotifier.onboardingSlides.length,
                  controller: pageController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
