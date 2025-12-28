part of 'export.widgets.dart';

class OnboardingCta extends ConsumerWidget {
  const OnboardingCta({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: baseViewPaddingBig,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              onTap: () {
                ref.read(routerProvider)
                    .pushNamed(getNameFromRoute(Routes.pokemonList));
              },
              title: 'Get started!',
              delayTime: 300,
              animationDuration: midDuration,
            ),
            Gap(82),
          ],
        ),
      ),
    );
  }
}
