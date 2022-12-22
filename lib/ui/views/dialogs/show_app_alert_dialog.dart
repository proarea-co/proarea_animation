import 'package:flutter/material.dart';

import 'app_alert_dialog.dart';

Future<T?> showAppAlertDialog<T>(
  BuildContext context, {
  String title = '',
  String info = '',
  String cancelText = '',
  String acceptText = '',
  VoidCallback? onCancel,
  VoidCallback? onAccept,
  Color? cancelColor,
  Color? acceptColor,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AppAlertDialog(
        title: title,
        info: info,
        cancelText: cancelText,
        acceptText: acceptText,
        onCancel: onCancel,
        onAccept: onAccept,
        cancelColor: cancelColor,
        acceptColor: acceptColor,
      );
    },
  );
}
