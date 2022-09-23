import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? errorText;

  const PasswordField({
    super.key,
    required this.controller,
    this.hintText,
    this.errorText,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _visibleInput = false;
  bool isNotEmpty = false;

  @override
  void initState() {
    super.initState();
    isNotEmpty = widget.controller.text.isNotEmpty;
    widget.controller.addListener(() {
      setState(() {
        isNotEmpty = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      borderRadius: BorderRadius.circular(6),
      gapPadding: 1,
    );
    return TextFormField(
      controller: widget.controller,
      obscureText: !_visibleInput,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      style: Theme.of(context).textTheme.bodyText1,
      scrollPadding: const EdgeInsets.only(),
      decoration: InputDecoration(
        prefixIcon: _buildLeadIcon(),
        suffixIcon: _buildSuffixIcon(),
        hintText: widget.hintText,
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        focusedBorder: border,
        disabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
        enabledBorder: border,
        isDense: true,
        errorMaxLines: 3,
        counterStyle: Theme.of(context).textTheme.bodyText1,
        hintStyle: Theme.of(context).textTheme.bodyText2,
        errorText: widget.errorText,
      ),
    );
  }

  Widget _buildLeadIcon() {
    return const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 18, 8, 18),
      child: Icon(Icons.lock),
    );
  }

  SizedBox _buildSuffixIcon() {
    final color = Theme.of(context).colorScheme.onSurface;
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            iconSize: 18,
            constraints: const BoxConstraints(maxWidth: 18, minWidth: 18),
            padding: const EdgeInsets.only(),
            icon: _visibleInput
                ? Icon(Icons.visibility, color: color)
                : Icon(Icons.visibility_off, color: color),
            onPressed: () {
              setState(() {
                _visibleInput = !_visibleInput;
              });
            },
          ),
          if (isNotEmpty)
            IconButton(
              iconSize: 18,
              constraints: const BoxConstraints(maxWidth: 32, minWidth: 32),
              padding: const EdgeInsets.only(),
              icon: Icon(Icons.close, color: color),
              onPressed: () {
                widget.controller.clear();
              },
            ),
          if (!isNotEmpty) const SizedBox(width: 8),
        ],
      ),
    );
  }
}
