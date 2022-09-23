import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleLineField extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLength;
  final String? hintText;

  const SingleLineField({
    super.key,
    this.maxLength,
    required this.controller,
    this.hintText,
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
      key: key,
      controller: controller,
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
        hintStyle: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
