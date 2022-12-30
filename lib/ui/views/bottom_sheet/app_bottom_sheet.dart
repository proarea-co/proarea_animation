import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class AppBottomSheet<T> {
  final BuildContext context;

  AppBottomSheet.of(this.context);

  Future<T?> showBottomSheet({
    String title = '',
    Widget? body,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colorScheme.onBackground,
      builder: (_) => _buildShape(title, body),
    );
  }

  Widget _buildShape(String title, Widget? body) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 28),
        decoration: BoxDecoration(
          color: context.colorScheme.onPrimaryContainer,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: _buildContent(title, body),
        ),
      ),
    );
  }

  Widget _buildContent(String title, Widget? body) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 4,
          width: 44,
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        if (title.isNotEmpty) ...[
          const SizedBox(height: 32),
          Text(
            title,
            style: context.textTheme.headline1?.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 44),
        ],
        SafeArea(
          top: false,
          child: body ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
