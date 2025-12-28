part of 'export.widgets.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key,
    required this.illustration,
    required this.child,
  });

  final Widget illustration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Align(
            alignment: Alignment.bottomCenter,
            child: illustration)),
        SizedBox(
          height: 409,
          child: onboardingContent(child),
        ),
      ],
    );
  }

  Widget onboardingContent(Widget child) {
    return ScrollUi(
      padding: EdgeInsets.only(bottom: 200),
      child: Column(
        children: [
          Gap(93.13),
          BorderBoxUi(
            height: 149.74,
            child: ScrollUi(
                padding: baseViewTopPadding10,
                child: child),
          ),
        ],
      ),
    );
  }
}

