import 'package:pokemon/core/extensions/export_extensions.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/theme/app.themes.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart' as flutter_animator;
import 'package:hooks_riverpod/hooks_riverpod.dart';

bool keyboardIsActive = false;
String selectedCopy = '';

extension BuildContextExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  Color get primaryColor => themeData.primaryColor;

  Color get errorColor => themeData.disabledColor;

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  TextTheme get accentTextTheme => Theme.of(this).textTheme;

  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  void pop<T>([T? result]) => Navigator.pop(this, result);

  void maybePop<T>([T? result]) => Navigator.maybePop(this, result);

  Future<T?> push<T>(Widget widget, {bool fullscreenDialog = false}) =>
      Navigator.push<T>(
          this,
          MaterialPageRoute(
              builder: (context) => widget,
              fullscreenDialog: fullscreenDialog));

  void pushReplacement(Widget widget, {bool fullscreenDialog = false}) =>
      Navigator.pushReplacement(
          this,
          MaterialPageRoute(
              builder: (context) => widget,
              fullscreenDialog: fullscreenDialog));

  void pushAndRemoveUntil(Widget widget, {bool fullscreenDialog = false}) =>
      Navigator.pushAndRemoveUntil(
          this,
          MaterialPageRoute(
              builder: (context) => widget, fullscreenDialog: fullscreenDialog),
          (Route<dynamic> route) => false);

  void showSnackMessage(BuildContext context, String text, {bool isError = true}) {
    final color = isError ? Colors.redAccent : Colors.green;
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future showErrorDialog({
    String title = "Hold up!",
    required String message,
    Function? onTap,
    String okText = 'OK',
    bool canBeDismissed = true,
  }) {
    return showDialog(
        context: this,
        barrierDismissible: canBeDismissed,
        builder: (context) {
          return flutter_animator.BounceIn(
            preferences: const flutter_animator.AnimationPreferences(
                offset: zeroDuration,
                duration: midDuration,
                magnitude: 0.3
            ),
            child: CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmartMedia.fadeAssetSvg(errorIcon,
                      height: 14,
                  ),
                  Gap(6),
                  TextUi.dialogTitle(title),
                ],
              ),
              content: Padding(
                padding: baseViewPaddingV6,
                child: TextUi.dialogBody(message,
                  style: textInputLight400.copyWith(
                    fontSize: 12.5,
                    color: grayScale850
                  ),),
              ),
              actions: [
                Consumer(
                  builder: (BuildContext context, ref, Widget? child) {
                    final theme = AppThemes.customAppTheme(ref);
                    return CupertinoDialogAction(
                        onPressed:
                        onTap != null ? () => onTap() : () => context.pop(),
                        child: FadeInUpUi(
                          animationMagnitude: 0.1,
                          animationDuration: midDuration.inMilliseconds,
                          animationOffset: 100,
                          child: TextUi.dialogButton(okText,
                              color: theme.inverseColor,
                          ),
                        ));
                  },
                ),
              ],
            ),
          );
        });
  }

  Future showAlertDialog({
    String title = "Hold up!",
    required String message,
    Function? onTap,
    String okText = 'OK',
    bool canBeDismissed = true,
  }) {
    return showDialog(
        context: this,
        builder: (context) {
          return flutter_animator.BounceIn(
            preferences: const flutter_animator.AnimationPreferences(
                offset: zeroDuration,
                duration: midDuration,
                magnitude: 0.3
            ),
            child: CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmartMedia.fadeAssetSvg(alertIcon, height: 14),
                  Gap(6),
                  TextUi.dialogTitle(title),
                ],
              ),
              content: Padding(
                padding: baseViewPaddingV6,
                child: TextUi.dialogBody(message,
                  style: textInputLight400.copyWith(
                      fontSize: 12.5,
                      color: grayScale850
                  ),),
              ),
              actions: [
                Consumer(
                  builder: (BuildContext context, ref, Widget? child) {
                    final theme = AppThemes.customAppTheme(ref);
                    return CupertinoDialogAction(
                        onPressed:
                        onTap != null ? () => onTap() : () => context.pop(),
                        child: FadeInUpUi(
                          animationMagnitude: 0.1,
                          animationDuration: midDuration.inMilliseconds,
                          animationOffset: 100,
                          child: TextUi.dialogButton(okText,
                            color: theme.inverseColor,
                          ),
                        ));
                  },
                ),
              ],
            ),
          );
        });
  }

  Future showOptionsDialog({
    required String title,
    required String message,
    Function? onOk,
    Function? onCancel,
    String okText = 'OK',
    String cancelText = 'Cancel',
    bool showCancel = true,
  }) {
    return showDialog(
        context: this,
        builder: (context) {
          return flutter_animator.BounceIn(
            preferences: const flutter_animator.AnimationPreferences(
                offset: zeroDuration,
                duration: midDuration,
                magnitude: 0.3
            ),
            child: CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmartMedia.fadeAssetSvg(alertIcon, height: 14),
                  Gap(6),
                  TextUi.dialogTitle(title),
                ],
              ),
              content: Padding(
                padding: baseViewPaddingV6,
                child: TextUi.dialogBody(message,
                  style: textInputLight400.copyWith(
                      fontSize: 12.5,
                      color: grayScale850
                  ),),
              ),
              actions: [
                Consumer(
                  builder: (BuildContext context, ref, Widget? child) {
                    final theme = AppThemes.customAppTheme(ref);
                    return CupertinoDialogAction(
                        onPressed: () {
                          pop();
                          onOk?.call();
                        },
                        child: FadeInUpUi(
                          animationMagnitude: 0.1,
                          animationDuration: midDuration.inMilliseconds,
                          animationOffset: 100,
                          child: TextUi.dialogButton(okText,
                            color: theme.inverseColor,
                          ),
                        ));
                  },
                ),
                if (showCancel) ...[
                  Consumer(
                    builder: (BuildContext context, ref, Widget? child) {
                      final theme = AppThemes.customAppTheme(ref);
                      return CupertinoDialogAction(
                          onPressed: () {
                            pop();
                            onCancel?.call();
                          },
                          child: FadeInUpUi(
                            animationMagnitude: 0.1,
                            animationDuration: midDuration.inMilliseconds,
                            animationOffset: 100,
                            child: TextUi.dialogButton(okText,
                              color: theme.inverseColor,
                            ),
                          ));
                    },
                  ),
                ],
              ],
            ),
          );
        });
  }

  Future showSuccessDialog({
    String title = "Successful",
    required String message,
    Function? onTap,
    String okText = 'OK',
  }) {
    return showDialog(
        context: this,
        builder: (context) {
          return flutter_animator.BounceIn(
            preferences: const flutter_animator.AnimationPreferences(
                offset: zeroDuration,
                duration: midDuration,
                magnitude: 0.3
            ),
            child: CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmartMedia.fadeAssetSvg(successIcon, height: 14),
                  Gap(6),
                  TextUi.dialogTitle(title),
                ],
              ),
              content: Padding(
                padding: baseViewPaddingV6,
                child: TextUi.dialogBody(message,
                  style: textInputLight400.copyWith(
                      fontSize: 12.5,
                      color: grayScale850
                  ),),
              ),
              actions: [
                Consumer(
                  builder: (BuildContext context, ref, Widget? child) {
                    final theme = AppThemes.customAppTheme(ref);
                    return CupertinoDialogAction(
                        onPressed:
                        onTap != null ? () => onTap() : () => context.pop(),
                        child: FadeInUpUi(
                          animationMagnitude: 0.1,
                          animationDuration: midDuration.inMilliseconds,
                          animationOffset: 100,
                          child: TextUi.dialogButton(okText,
                            color: theme.inverseColor,
                          ),
                        ));
                  },
                ),
              ],
            ),
          );
        });
  }
}
