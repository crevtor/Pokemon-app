import 'dart:async';
import 'package:pokemon/core/extensions/export.extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PopScopeUi extends ConsumerWidget {
  final bool enableWillPopScope;
  final FutureOr<dynamic> Function()? onPopResult;

  final bool useRootNavigator;
  final Widget child;

  const PopScopeUi({
    super.key,
    required this.child,
    this.enableWillPopScope = false,
    this.onPopResult,
    this.useRootNavigator = false,
  });

  @override
  Widget build(BuildContext context, ref) {
    return PopScope(
      canPop: enableWillPopScope,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        if (onPopResult != null) {
          onPopResult!();
        } else {
          context.maybePop();
        }
      },
      child: child,
    );
  }
}
