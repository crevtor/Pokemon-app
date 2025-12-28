import 'dart:ui' as ui;

import 'package:pokemon/core/resources/export.resources.dart';
import 'package:flutter/material.dart';

class BlurredShaderUi extends StatelessWidget {
  final Size size;
  final Color? shadeColor;
  final double sigmaValue;
  const BlurredShaderUi({super.key,
    this.size = Size.zero,
    this.sigmaValue = 9.0,
    this.shadeColor});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 3.14,
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: sigmaValue,
            sigmaY: sigmaValue,
          ),
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0x8068259C), // 50% red
                  primary450,
                ],
                stops: [0.0, 0.6, 1.0], // soften the midpoint
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstOut,
            child: Container(
              height: size.height,
              decoration: BoxDecoration(
                color: shadeColor ?? primary450,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
