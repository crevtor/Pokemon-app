import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/animators.widget.dart';
import 'package:flutter/material.dart';

class TextUi extends StatelessWidget {
  const TextUi(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.textAlign = TextAlign.left,
    this.isSelectable = false,
    this.height,
    this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
    this.style = regularBody,
  });

  const TextUi.onBoardingTitle(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.center,
        this.style = onBoardingTitle,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
      });

  const TextUi.onBoardingBody(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.center,
        this.style = onBoardingBody,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
      });

  const TextUi.actionButtonText(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.left,
        this.style = actionButtonText,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
      });

  const TextUi.dialogTitle(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.center,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
        this.style = dialogTitle,
      });

  const TextUi.dialogBody(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.center,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
        this.style = dialogBody,
      });

  const TextUi.dialogButton(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.center,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
        this.style = dialogButton,
      });

  const TextUi.backNavTitle(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.left,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
        this.style = backNavTitle,
      });

  const TextUi.backNavSubTitle(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.left,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
        this.style = backNavSubTitle,
      });

  const TextUi.otherInfoTitle(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.left,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
        this.style = otherInfoTitle,
      });

  const TextUi.otherInfoSubTitle(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.left,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
        this.style = otherInfoSubTitle,
      });

  const TextUi.tabLabelStyle(
      this.data, {
        super.key,
        this.color,
        this.maxLines,
        this.fontWeight,
        this.textAlign = TextAlign.left,
        this.isSelectable = false,
        this.height,
        this.overflow,
        this.animationMagnitude,
        this.animationDuration,
        this.animationOffset,
        this.style = tabLabelStyle,
      });

  final String? data;
  final TextStyle? style;
  final Color? color;
  final double? animationMagnitude;
  final int? animationDuration;
  final int? animationOffset;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool? isSelectable;
  final double? height;
  final TextOverflow? overflow;


  @override
  Widget build(BuildContext context) {
    if (isSelectable!) {
      return SelectableText(
        data ?? '',
        textAlign: textAlign,
        textScaleFactor: 1,
        style: style?.copyWith(
          color: color,
          fontSize: style?.fontSize,
          fontWeight: fontWeight,
          height: height,
        ),
        maxLines: maxLines,
      );
    }

    if(animationOffset != null) {
      return FadeInUpUi(
        animationMagnitude: animationMagnitude,
        animationDuration: animationDuration,
        animationOffset: animationOffset ?? 50,
        child: Text(
          data ?? '',
          textAlign: textAlign,
          textWidthBasis: TextWidthBasis.parent,
          textScaleFactor: 1,
          maxLines: maxLines,
          overflow: overflow ?? TextOverflow.visible,
          softWrap: true,
          style: style?.copyWith(
            color: color,
            fontSize: style?.fontSize,
            height: height ?? style?.height ?? 1.5,
            fontWeight: fontWeight ?? style?.fontWeight,
          ),
        ),
      );
    }

    return Text(
      data ?? '',
      textAlign: textAlign,
      textWidthBasis: TextWidthBasis.parent,
      textScaleFactor: 1,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.visible,
      softWrap: true,
      style: style?.copyWith(
        color: color,
        fontSize: style?.fontSize,
        height: height ?? style?.height ?? 1.5,
        fontWeight: fontWeight ?? style?.fontWeight,
      ),
    );
  }
}
