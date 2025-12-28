import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'header_padding.provider.g.dart';

@riverpod
class HeaderPaddingState extends _$HeaderPaddingState {
  @override
  Size build() {
    return Size.zero;
  }

  void updatePaddingState(Size value) {
    state = value;
  }
}
