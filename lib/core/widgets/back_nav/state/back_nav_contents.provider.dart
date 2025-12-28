import 'dart:ui';

import 'package:pokemon/core/models/export.models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BackNavContentController extends StateNotifier<BackNavContentModel> {
  BackNavContentController(): super(BackNavContentModel('', ''));

  void update(String title, String subTitle, {String? highlightedText}) {
    state = state.copyWith(title: title, subTitle: subTitle,
        highlightedText: highlightedText ?? '');
  }

  void updateHeaderSize(Size size) {
    state = state.copyWith(headerWidgetSize: size);
  }
}

final backNavContentProvider = StateNotifierProvider<BackNavContentController, BackNavContentModel>(
        (ref) => BackNavContentController());