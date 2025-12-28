import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GlassBackNavBar extends HookWidget {
  final String pageName;
  final String subTitle;
  final Widget? subWidget;
  final double subWidgetTopSpacing;
  final String highlightedText;
  final bool useHero;
  final bool useBackButton;
  final bool showBackButton;
  final bool centerPageName;
  final bool useFadeAnimation;
  final double paddingLeft;
  final double topMargin;
  final double? currentStep;
  final double? totalSteps;
  final double? navHeight;
  final double? navBottomMargin;
  final double? percentCompletion;
  final int animationDuration;
  final double animationMagnitude;
  final int animationOffset;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color pageNameColor;
  final Function? onTap;
  final EdgeInsets? boxPadding;
  final Color glassColor;
  final ValueChanged<Size> widgetDimension;
  const GlassBackNavBar({super.key,
    this.glassColor = black150,
    required this.widgetDimension,
    this.boxPadding,
    this.pageName = '',
    this.subTitle = '',
    this.highlightedText = '',
    this.centerPageName = false,
    this.useHero = true,
    this.useFadeAnimation = true,
    this.useBackButton = true,
    this.showBackButton = true,
    this.currentStep,
    this.totalSteps,
    this.topMargin = 66,
    this.paddingLeft = 20,
    this.navHeight = 74,
    this.navBottomMargin = 16,
    this.animationDuration = 500,
    this.animationMagnitude = 0.1,
    this.animationOffset = 100,
    this.percentCompletion,
    this.subWidget,
    this.subWidgetTopSpacing = 20,
    this.iconColor = charcoal500,
    this.pageNameColor = black800,
    this.iconBackgroundColor = grayScale10,
    this.onTap
  });


  @override
  Widget build(BuildContext context) {
    final ctaSize = useState<Size>(Size.zero);

    return Stack(
      children: [
        Transform.translate(offset: Offset(0, -1),
            child: Transform.rotate(
                angle: 3.14,
                child: BlurredShaderUi(
                  size: ctaSize.value,
                  shadeColor: black150,
                ))
        ),
        MeasureSize(
          onChange: (size) {
            ctaSize.value = size;
            widgetDimension(size);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BackNavBar(
                boxPadding: boxPadding,
                pageName: pageName,
                subTitle: subTitle,
                highlightedText: highlightedText,
                centerPageName: centerPageName,
                useHero: useHero,
                useFadeAnimation: useFadeAnimation,
                useBackButton: useBackButton,
                showBackButton: showBackButton,
                currentStep: currentStep,
                totalSteps: totalSteps,
                topMargin: topMargin,
                paddingLeft: paddingLeft,
                navHeight: navHeight,
                navBottomMargin: navBottomMargin,
                animationDuration: animationDuration,
                animationMagnitude: animationMagnitude,
                animationOffset: animationOffset,
                percentCompletion: percentCompletion,
                iconColor: iconColor,
                pageNameColor: pageNameColor,
                iconBackgroundColor: iconBackgroundColor,
                onTap: onTap,
              ),
              if(subWidget != null) ...[
                Gap(subWidgetTopSpacing),
                Padding(
                  padding: boxPadding ?? baseViewPaddingBig,
                  child: subWidget ?? SizedBox.shrink(),
                ),
              ]
            ],
          )
        )
      ],
    );
  }
}
