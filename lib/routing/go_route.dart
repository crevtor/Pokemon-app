import 'package:pokemon/core/extensions/export_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/features/pokemon/data/responses/pokemon_list.model.dart';
import 'package:pokemon/features/pokemon/view/pokemon_details/pokemon_details.page.dart';
import 'package:pokemon/features/pokemon/view/pokemon_list/pokemons.page.dart';
import 'package:pokemon/routing/views.dart';
import 'package:pokemon/routing/app_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stacked_services/stacked_services.dart';

part 'go_route.g.dart';

final navigationKey = StackedService.navigatorKey ?? GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
      navigatorKey: navigationKey,
      debugLogDiagnostics: false,
      initialLocation: Routes.splash,
      observers: [
        // SentryNavigatorObserver()
      ],
      routes: [
        GoRoute(
          path: Routes.splash,
          name: getNameFromRoute(Routes.splash),
          builder: (ctx, state) {
            return const SplashPageUi();
          },
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: SplashPageUi(),
              opaque: false,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            );
          },
        ),

        GoRoute(
          path: Routes.onboarding,
          name: getNameFromRoute(Routes.onboarding),
          builder: (ctx, state) {
            return const OnboardingPageUi();
          },
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: OnboardingPageUi(),
              opaque: false,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            );
          }
        ),

        GoRoute(
            path: Routes.pokemonList,
            name: getNameFromRoute(Routes.pokemonList),
            builder: (ctx, state) {
              return const PokemonListPageUi();
            },
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: PokemonListPageUi(),
              opaque: false,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
            routes: [
              GoRoute(
                path: Routes.pokemonDetails,
                name: getNameFromRoute(Routes.pokemonDetails),
                builder: (ctx, state) {
                  return PokemonDetailsPage(
                      item: state.extra as PokemonListItem
                  );
                },
                pageBuilder: (context, state) => CustomTransitionPage<void>(
                  key: state.pageKey,
                  child: PokemonDetailsPage(
                      item: state.extra as PokemonListItem
                  ),
                  opaque: false,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
                ),
              ),
            ]
        ),
      ]);

  ref.onDispose(router.dispose);

  return router;
}
