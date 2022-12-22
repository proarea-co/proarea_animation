import 'package:flutter/material.dart';

import '../../../themes/theme_app.dart';

class AppSnackBar {
  final BuildContext context;

  AppSnackBar.of(this.context);

  void showError(String message) => _showAlertSnackBar(message, true);

  void showSuccess(String message) => _showAlertSnackBar(message, false);

  void showInfo(String message) => _showSnackBar(message);

  void _showAlertSnackBar(String message, bool error) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackBar(_buildContentByAlerts(error, message)),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackBar(_buildContent(message)),
    );
  }

  SnackBar _buildSnackBar(Widget content) {
    return SnackBar(
      elevation: 0,
      margin: const EdgeInsets.fromLTRB(28, 0, 28, 4),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: content,
    );
  }

  Widget _buildContentByAlerts(bool error, String message) {
    return Card(
      color: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          children: [
            _buildIcon(error),
            const SizedBox(width: 8),
            Expanded(child: _buildMessage(message, error)),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(bool error) {
    if (error) {
      return Icon(
        Icons.error,
        color: context.colorScheme.error,
      );
    }

    return Icon(
      Icons.info_outline,
      color: context.colorScheme.secondary,
    );
  }

  Widget _buildMessage(String message, bool error) {
    return Text(
      message,
      style: context.textTheme.bodyText1?.copyWith(
        fontWeight: FontWeight.w500,
        color:
            error ? context.colorScheme.error : context.colorScheme.secondary,
      ),
    );
  }

  Widget _buildContent(String message) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.tertiaryContainer.withOpacity(.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: context.colorScheme.tertiaryContainer.withOpacity(.08),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          message,
          style: context.textTheme.bodyText1?.copyWith(
            fontSize: 13,
            letterSpacing: -0.08,
            fontWeight: FontWeight.w400,
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
