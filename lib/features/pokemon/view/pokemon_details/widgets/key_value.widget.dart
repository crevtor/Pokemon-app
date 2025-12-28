part of 'export.widgets.dart';

class KeyValueUi extends StatelessWidget {
  const KeyValueUi({super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.left,
      TextSpan(
        text: '$title:',
        style: onBoardingTitle,
        children: [
          TextSpan(
            text: ' $value',
            style: onBoardingSelectedTitle,
          ),
        ],
      ),
    );
  }
}
