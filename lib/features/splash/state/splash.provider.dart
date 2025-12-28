import 'package:pokemon/core/extensions/export.extensions.dart';
import 'package:pokemon/core/models/export.models.dart';
import 'package:pokemon/core/services/export.services.dart';
import 'package:pokemon/core/view_models/export.view_models.dart';
import 'package:pokemon/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashLogic {
  SplashLogic();

  Future<void> handleStartupLogic(BuildContext context, WidgetRef ref) async {
    final SecondaryState state = userStateStorageService.getSecondaryState();

    // 1) First time user
    if (!state.isLoggedIn) {
      ref.read(routerProvider).go(Routes.onboarding);
      return;
    }

    // 2) logged in user
    ref.read(routerProvider).goNamed(getNameFromRoute(Routes.pokemonList));
  }
}

final splashLogicProvider = Provider<SplashLogic>((ref) {
  return SplashLogic();
});
