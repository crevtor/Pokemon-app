part of 'export.widgets.dart';

class AppLogoUi extends ConsumerWidget {
  const AppLogoUi({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Positioned(
      top: MediaQuery.paddingOf(context).top,
      left: 30,
      child: RubberBand(
        preferences: AnimationPreferences(
            offset: extraSlowDuration1000,
        ),
        child: SmartMedia.fadeAssetImage(
            pokemonPng,
            width: 109,
            height: 61.26
        ),
      ),
    );
  }
}
