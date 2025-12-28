import 'package:flutter/material.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';

class BorderBoxUi extends StatelessWidget {
  final Widget child;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadiusGeometry? borderRadius;
  final Offset? shadowOffset;

  const BorderBoxUi({
    super.key,
    required this.child,
    required this.height,
    this.width,
    this.padding,
    this.margin,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.shadowOffset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: baseViewPaddingBig,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Transform.translate(
            offset: shadowOffset ?? Offset(3.95, 3.94),
            child: ClipRRect(
              borderRadius: BorderRadius.all(smallRadius12),
              child: SimpleBoxUi(
                color: color ?? charcoal500,
                height: height,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color ?? secondary450,
              borderRadius: borderRadius ?? BorderRadius.all(smallRadius12),
              border: Border.all(
                color: color ?? charcoal500,
                width: borderWidth ?? 1.0,
              ),
            ),
            child: child,
          )
        ],
      ),
    );
  }
}
