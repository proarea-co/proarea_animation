import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  static const double _hightControlButton = 52;

  final TextEditingController controller;
  final bool autoFocus;
  final String hintText;

  const SearchField({
    super.key,
    required this.controller,
    this.autoFocus = false,
    this.hintText = '...',
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
    return SizedBox(
      height: _hightControlButton,
      child: TextFormField(
        controller: controller,
        autofocus: autoFocus,
        style: Theme.of(context).textTheme.bodyText1,
        scrollPadding: EdgeInsets.zero,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          contentPadding: const EdgeInsets.only(),
          focusedBorder: focusedBorder,
          disabledBorder: border,
          errorBorder: border,
          enabledBorder: border,
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          suffixIcon: GestureDetector(
            onTap: controller.clear,
            child: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          isDense: true,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
