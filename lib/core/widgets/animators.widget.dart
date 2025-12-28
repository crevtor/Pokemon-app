import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class FadeInUpUi extends StatelessWidget {
  final Widget? child;
  final double? animationMagnitude;
  final int? animationDuration;
  final int? animationOffset;

  const FadeInUpUi({super.key,
    this.animationMagnitude,
    this.animationDuration,
    this.animationOffset, this.child});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      preferences: AnimationPreferences(
          offset: Duration(milliseconds: animationOffset ?? 0),
          duration: Duration(milliseconds: animationDuration ?? 500),
          magnitude: animationMagnitude ?? 0.1
      ),
      child: child ?? SizedBox.shrink(),
    );
  }
}

class FadeInUi extends StatelessWidget {
  final Widget? child;
  final double? animationMagnitude;
  final int? animationDuration;
  final int? animationOffset;

  const FadeInUi({super.key,
    this.animationMagnitude,
    this.animationDuration,
    this.animationOffset, this.child});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      preferences: AnimationPreferences(
          offset: Duration(milliseconds: animationOffset ?? 0),
          duration: Duration(milliseconds: animationDuration ?? 500),
          magnitude: animationMagnitude ?? 0.1
      ),
      child: child ?? SizedBox.shrink(),
    );
  }
}
