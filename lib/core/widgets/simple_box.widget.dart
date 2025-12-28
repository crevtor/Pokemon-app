import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as mt;

class SimpleBoxUi extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding; // inner
  final EdgeInsetsGeometry? margin;  // outer
  final Widget? child;
  final Color? color;

  const SimpleBoxUi({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color ?? mt.Colors.transparent,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
