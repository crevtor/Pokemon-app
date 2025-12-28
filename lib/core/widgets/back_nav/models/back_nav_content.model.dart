part of 'export.models.dart';

class BackNavContentModel {
  final String title;
  final String subTitle;
  final String highlightedText;
  final Size headerWidgetSize;

  BackNavContentModel(this.title, this.subTitle, {this.highlightedText = '',
    this.headerWidgetSize = Size.zero});

  BackNavContentModel copyWith({String? title, String? subTitle,
    String? highlightedText, Size? headerWidgetSize}) {
    return BackNavContentModel(
        title ?? this.title,
        subTitle ?? this.subTitle,
        highlightedText: highlightedText ?? this.highlightedText,
        headerWidgetSize: headerWidgetSize ?? this.headerWidgetSize,
    );
  }
}