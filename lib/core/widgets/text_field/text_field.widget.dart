import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TextFieldUi extends StatefulWidget {
  const TextFieldUi({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.helperText = '',
    this.labelText,
    this.decoration,
    this.prefixIcon,
    this.errorStyle,
    this.hintStyle,
    this.suffixIcon,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.validator,
    this.inputFormatter,
    this.maxLines = 1,
    this.textStyle,
    this.textInputAction,
    this.focusNode,
    this.onTap,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.autoValidateMode,
    this.alwaysShowHelperText = false,
    this.readOnly = false,
    this.enabled = true,
    this.useHeightConstraint = true,
    this.textColor = black800,
    this.fillColor = white,
    this.fillColorDisabled = white,
    this.generalBorderColor = black180,
    this.containerMargin,
    this.height = 48,
    this.animationDuration = 500,
    this.animationOffset = 1,
    this.animationMagnitude = 0.05,
    required this.errorText,
    this.showcaseErrorInWidget = true,
  });

  final String hintText;
  final String helperText;
  final String? labelText;
  final bool useHeightConstraint;
  final double height;
  final bool alwaysShowHelperText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputDecoration? decoration;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final AutovalidateMode? autoValidateMode;
  final bool readOnly;
  final bool enabled;
  final Color textColor;
  final Color fillColor;
  final Color fillColorDisabled;
  final Color generalBorderColor;
  final EdgeInsets? containerMargin;
  final int animationDuration;
  final int animationOffset;
  final double animationMagnitude;
  final ValueChanged<String> errorText;
  final bool showcaseErrorInWidget;

  @override
  State<TextFieldUi> createState() => _TextFieldUiState();
}

class _TextFieldUiState extends State<TextFieldUi> {
  late FocusNode focusNode;
  late GlobalKey<FormFieldState<String>> _formFieldKey;
  final _showClearButton = false.obs;
  final _hasFocus = false.obs;
  final hasError = false.obs;
  final errorText = ''.obs;

  void showBorderMethod() {
    if (focusNode.hasPrimaryFocus && mounted) {
      _hasFocus.value = true;
    } else {
      _hasFocus.value = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _formFieldKey = GlobalKey<FormFieldState<String>>();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(showBorderMethod);
    widget.controller.addListener(() {
      _showClearButton.value = widget.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => widget.animationMagnitude == 0 ? textField() : FadeInUpUi(
            animationOffset: widget.animationOffset,
            animationDuration: widget.animationDuration,
            animationMagnitude: widget.animationMagnitude,
            child: textField(),
          ),
    );
  }

  Widget textField() {
    return Container(
        margin: widget.containerMargin?.w ?? baseViewPaddingBig.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              key: _formFieldKey,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              textCapitalization: widget.textCapitalization,
              autovalidateMode: widget.autoValidateMode,
              autofocus: widget.autofocus,
              validator: (value) {
                final errorText = widget.validator?.call(value);
                hasError.value = errorText?.isNotEmpty ?? false;
                this.errorText.value = errorText ?? '';
                widget.errorText(this.errorText.value);
                return errorText;
              },
              controller: widget.controller,
              readOnly: widget.readOnly,
              enabled: widget.enabled,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onFieldSubmitted: widget.onFieldSubmitted,
              keyboardType: widget.keyboardType,
              autocorrect: false,
              focusNode: focusNode,
              inputFormatters: widget.inputFormatter,
              style: textInputRegular600.copyWith(color: widget.textColor),
              cursorColor: widget.textColor,
              cursorWidth: 1,
              cursorHeight: 20.h,
              textInputAction: widget.textInputAction,
              textAlignVertical: TextAlignVertical.center,
              obscureText: widget.obscureText,
              obscuringCharacter: '●',
              decoration: widget.decoration ??
                  InputDecoration(
                    filled: true,
                    fillColor: !widget.enabled ? widget.fillColorDisabled : widget.fillColor,
                    hintText: widget.hintText,
                    hintStyle: widget.hintStyle ?? textInputLight400,
                    errorStyle: const TextStyle(height: 0.01, fontSize: 0),
                    prefixIcon: widget.prefixIcon,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(smallRadius12),
                      borderSide: BorderSide(width: 1, color: widget.generalBorderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(smallRadius12),
                      borderSide: BorderSide(width: 1, color: widget.generalBorderColor),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(smallRadius12),
                      borderSide: BorderSide(width: 1, color: widget.generalBorderColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(smallRadius12),
                      borderSide: const BorderSide(width: 1, color: error600),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(smallRadius12),
                      borderSide: BorderSide(width: 1, color: widget.generalBorderColor),
                    ),
                    suffixIcon: _showClearButton.value && _hasFocus.value
                        ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.controller.clear.call();
                            widget.onChanged?.call('');
                            widget.controller.value = TextEditingValue.empty;
                            widget.onFieldSubmitted?.call('');
                          },
                          child: const Icon(
                            Icons.clear,
                            size: 18,
                            color: grayScale150,
                          ),
                        ),
                        const Gap(16),
                        if (widget.suffixIcon != null) ...[
                          widget.suffixIcon ?? SizedBox.shrink(),
                          const Gap(16),
                        ],
                      ],
                    ) : IntrinsicWidth(
                      child: Row(
                        children: [
                          if (widget.suffixIcon != null) ...[
                            widget.suffixIcon ?? SizedBox.shrink(),
                            const Gap(16),
                          ],
                        ],
                      ),
                    ),
                    constraints: !widget.useHeightConstraint ?
                    null : BoxConstraints(
                      maxHeight: widget.height,
                    ).h,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 9,
                    ).r,
                    prefixIconConstraints: const BoxConstraints(
                      minHeight: 24,
                      minWidth: 24,
                    ).r,
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 18,
                      minWidth: 18,
                    ).r,
                  ),
            ),
          ],
        )
    );
  }
}
