import 'package:flutter/cupertino.dart';

import '../../../themes/constants/light_style_constants.dart';
import '../../../themes/theme_app.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String info;
  final String cancelText;
  final String acceptText;
  final VoidCallback? onCancel;
  final VoidCallback? onAccept;
  final Color? cancelColor;
  final Color? acceptColor;

  const AppAlertDialog({
    super.key,
    this.title = '',
    this.info = '',
    this.cancelText = '',
    this.acceptText = '',
    this.onCancel,
    this.onAccept,
    this.cancelColor,
    this.acceptColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: _buildTitle(context),
      content: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: _buildDescription(context),
      ),
      actions: _buildActions(context),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final textTheme = context.textTheme;
    return Text(
      title,
      style: textTheme.button,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription(BuildContext context) {
    final textTheme = context.textTheme;
    return Text(
      info,
      style: textTheme.bodyText2,
      textAlign: TextAlign.center,
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    if (onCancel == null && onAccept == null) return [];
    return [
      if (onCancel != null)
        _buildButton(
          context,
          onPressed: onCancel,
          text: cancelText,
          color: cancelColor ?? context.colorScheme.onPrimary,
        ),
      if (onAccept != null)
        _buildButton(
          context,
          onPressed: onAccept,
          text: acceptText,
          color: acceptColor ?? context.colorScheme.error,
        ),
    ];
  }

  Widget _buildButton(
    BuildContext context, {
    VoidCallback? onPressed,
    String text = '',
    Color color = LightStyleConstants.charcoalTint1,
  }) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: color)),
    );
  }
}
