import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchFieldUi extends ConsumerWidget {
  const SearchFieldUi({
    super.key,
    required this.controller,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.onTap,
    this.autofocus = false,
    this.autoValidateMode,
    this.hintText = 'Search',
    this.showHelperText = true,
    this.containerMargin,
    this.bottomText,
    this.animationDuration = 500,
    this.animationOffset = 1,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool autofocus;
  final AutovalidateMode? autoValidateMode;
  final String hintText;
  final String? bottomText;
  final bool showHelperText;
  final EdgeInsets? containerMargin;
  final int animationDuration;
  final int animationOffset;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFieldUi(
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      containerMargin: containerMargin,
      keyboardType: TextInputType.name,
      height: 40,
      onTap: onTap,
      autofocus: autofocus,
      autoValidateMode: autoValidateMode,
      generalBorderColor: grayScale10,
      hintText: hintText,
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(12),
          SmartMedia.assetSvg(searchIcon),
          const Gap(6),
        ],
      ),
      inputFormatter: [
        // Blocks all symbols, unassigned, and surrogate pairs (emoji-like characters)
        FilteringTextInputFormatter.deny(RegExp(r'[\p{So}\p{Cn}\p{Cs}]', unicode: true),
        ),
      ],
      errorText: (error) {},
    );
  }
}
