import 'package:pokemon/core/resources/styles.res.dart';
import 'package:flutter/material.dart';

class ScrollUi extends StatelessWidget {
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final Widget? child;
  final Axis? axis;

  const ScrollUi({super.key, this.padding, this.physics, this.child, this.axis});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: physics ?? BouncingScrollPhysics(),
      scrollDirection: axis ?? Axis.vertical,
      padding: padding ?? zeroPadding,
      child: child ?? SizedBox.shrink(),
    );
  }
}
