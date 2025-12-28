import 'package:pokemon/core/resources/export.resources.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';

class HighlightTextWidget extends StatelessWidget {
  const HighlightTextWidget({
    super.key,
    this.splashHighlightWords,
    this.text,
    this.textAlign = TextAlign.left,
    this.textStyle = backNavSubTitle,
    this.maxLines,
  });
  final Map<String, HighlightedWord>? splashHighlightWords;
  final String? text;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextHighlight(
      text: text ?? '',
      maxLines: maxLines,
      words: splashHighlightWords ?? {'...': HighlightedWord(textStyle: backNavSubTitle)},
      textAlign: textAlign,
      textStyle: textStyle,
    );
  }
}
