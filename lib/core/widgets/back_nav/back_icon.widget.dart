import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/medias/medias.export.dart';
import 'package:pokemon/routing/go_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BackNavIconUi extends ConsumerWidget {
  final bool useBackButton;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String? icon;
  final Function? onTap;
  final EdgeInsets? iconPadding;
  const BackNavIconUi({super.key,
    this.iconPadding,
    this.useBackButton = true,
    this.icon,
    this.iconColor = primary100,
    this.iconBackgroundColor = charcoal500,
    this.onTap});


  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
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
        padding: iconPadding ?? EdgeInsets.all(useBackButton ? 7 : 10),
        child: SmartMedia.assetSvg(
          (icon != null) && (icon!.isNotEmpty) ? icon! :
          useBackButton ? arrowBackIcon : closeIcon,
          width: 20,
          height: 20,
          color: iconColor,
        ),
      ),
    );
  }
}
