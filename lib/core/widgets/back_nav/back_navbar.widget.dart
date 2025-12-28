import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/animators.widget.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:pokemon/routing/go_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BackNavBar extends HookWidget {
  final String pageName;
  final String subTitle;
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
  const BackNavBar({super.key,
    this.boxPadding,
    this.pageName = '',
    this.subTitle = '',
    this.highlightedText = '',
    this.centerPageName = false,
    this.useHero = true,
    this.useFadeAnimation = true,
    this.showBackButton = true,
    this.useBackButton = true,
    this.currentStep,
    this.totalSteps,
    this.topMargin = 66,
    this.paddingLeft = 20,
    this.navHeight = 74,
    this.navBottomMargin,
    this.animationDuration = 500,
    this.animationMagnitude = 0.1,
    this.animationOffset = 100,
    this.percentCompletion,
    this.iconColor = charcoal500,
    this.pageNameColor = black800,
    this.iconBackgroundColor = grayScale10,
    this.onTap});


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: boxPadding ?? baseViewPaddingBig,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(MediaQuery.paddingOf(context).top),
            if(showBackButton) ...[
              SizedBox(
                  height: navHeight ?? 74,
                  child: useHero ? Hero(
                    tag: "back_nav",
                    child: navBar(context),
                  ) : navBar(context)
              ),
            ],
            Gap(navBottomMargin ?? 8),
            if(pageName.isNotEmpty) ...[
              if(useFadeAnimation) ...[
                FadeInUpUi(
                  animationMagnitude: 0.1,
                  animationDuration: animationDuration == 0 ? 1 : animationDuration,
                  animationOffset: 100,
                  child: TextUi.backNavTitle(
                    pageName,
                    color: pageNameColor,
                  ),
                ),
              ]  else ...[
                TextUi.backNavTitle(
                  pageName,
                  color: pageNameColor,
                ),
              ],
            ],
            if(subTitle.isNotEmpty) ...[
              const Gap(8),
              FadeInUpUi(
                animationOffset: 200,
                animationDuration: animationDuration == 0 ? 1 : animationDuration+50,
                animationMagnitude: 0.1,
                child: Text.rich(
                  textAlign: TextAlign.left,
                  TextSpan(
                    text: '$subTitle ',
                    style: backNavSubTitle,
                    children: [
                      TextSpan(
                        text: highlightedText,
                        style: backNavSubTitle.copyWith(color: primary100),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget navBar(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, ref, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(useBackButton) ...[
              GestureDetector(
                onTap: onTap != null ? () {
                  HapticFeedback.lightImpact();
                  onTap!();} : () {
                  HapticFeedback.lightImpact();
                  ref.read(routerProvider).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconBackgroundColor,
                  ),
                  height: 32,
                  width: 32,
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero,
                  child: Transform.translate(
                    offset: const Offset(0,0),
                    child: SmartMedia.assetSvg(
                      arrowBackIcon,
                      width: 20,
                      height: 20,
                      color: iconColor,
                    ),
                  ),
                ),
              )
            ] else ...[
              GestureDetector(
                onTap: onTap != null ? () {
                  HapticFeedback.lightImpact();
                  onTap!();} : () {
                  HapticFeedback.lightImpact();
                  ref.read(routerProvider).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconBackgroundColor,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(11),
                  width: 32,
                  height: 32,
                  child: SmartMedia.assetSvg(
                    closeIcon,
                    color: iconColor,
                  ),
                ),
              )
            ],
          ],
        );
      },
    );
  }
}
