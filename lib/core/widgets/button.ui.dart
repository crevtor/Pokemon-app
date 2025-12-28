import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onTap,
    this.height = 52.38,
    this.title,
    this.radius = smallRadius12,
    this.onDoubleTap,
    this.delayTime = 0,
    this.animationDuration = superFastDuration,
    this.animationMagnitude = 0.1,
    this.nullTextOpacity = 0.8,
    this.nullBorderOpacity = 0.5,
    this.bg = primary500,
    this.nullBackground,
    this.borderColor = charcoal500,
    this.textColor = charcoal500,
    this.loaderColor = charcoal500,
    this.loading = false,
    this.useTitleWhenLoading = false,
    this.useBackgroundWhenLoading = false,
    this.paddingDimension = actionButtonPadding,
    this.borderRadius = smallRadius12,
    this.illustration = "",
    this.borderWidth = 1,
    this.textStyle
  });

  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final int delayTime;
  final Radius borderRadius;
  final double animationMagnitude;
  final Duration animationDuration;
  final Radius radius;
  final Color bg;
  final Color? nullBackground;
  final Color borderColor;
  final Color loaderColor;
  final Color textColor;
  final double borderWidth;
  final double height;
  final double nullTextOpacity;
  final double nullBorderOpacity;
  final bool useTitleWhenLoading;
  final bool useBackgroundWhenLoading;
  final String? title;
  final bool loading;
  final String illustration;
  final EdgeInsets paddingDimension;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return FadeInUpUi(
      animationMagnitude: animationMagnitude,
      animationDuration: animationDuration.inMilliseconds,
      animationOffset: delayTime,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(7.59, 7.62),
            child: ClipRRect(
              borderRadius: BorderRadius.all(borderRadius),
              child: Container(
                color: charcoal500,
                height: height,
              ),
            ),
          ),
          Bounce(
            onTap: loading ? null : onTap,
            scaleFactor: 0.98,
            behavior: HitTestBehavior.translucent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(borderRadius),
                border: Border.all(
                    color: onTap != null ?
                    borderColor : borderColor.withOpacity(nullBorderOpacity),
                    width: 2
                ),
                color: onTap == null ? nullBackground ?? bg : bg,
              ),
              height: height,
              padding: paddingDimension,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(loading) ...[
                    SpinKitThreeBounce(
                      color: white,
                      size: 17,
                    ),
                  ] else ...[
                    if(textStyle != null) ...[
                      TextUi.actionButtonText(title ?? 'Continue', style: textStyle),
                    ] else ...[
                      TextUi.actionButtonText(title ?? 'Continue',
                        color: onTap != null ? textColor : textColor.withOpacity(nullTextOpacity),
                      ),
                    ],
                    if(illustration.isNotEmpty) ...[
                      Transform.translate(
                        offset: const Offset(0,1),
                        child: SmartMedia.assetSvg(illustration,
                          width: 20,
                        ),
                      )
                    ],
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
