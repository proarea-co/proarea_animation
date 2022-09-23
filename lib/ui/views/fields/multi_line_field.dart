import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MultiLineField extends StatelessWidget {
  final TextEditingController controller;
  final bool autofocus;
  final int? maxLength;
  final int? maxLines;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;

  const MultiLineField({
    super.key,
    this.maxLength = 1000,
    required this.controller,
    this.autofocus = false,
    this.hintText,
    this.maxLines = 5,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      borderRadius: BorderRadius.circular(6),
      gapPadding: 1,
    );
    final focusedBorder = border.copyWith(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      maxLines: maxLines,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      style: Theme.of(context).textTheme.bodyText1,
      scrollPadding: const EdgeInsets.only(),
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        focusedBorder: focusedBorder,
        disabledBorder: border,
        errorBorder: border,
        enabledBorder: border,
        isDense: true,
        errorMaxLines: 3,
        counterStyle: Theme.of(context).textTheme.bodyText1,
        contentPadding: contentPadding,
        hintStyle: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
