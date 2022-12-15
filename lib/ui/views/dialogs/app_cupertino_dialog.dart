import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../bloc/settings/settings_cubit.dart';
import '../../../l10n/localization_helper.dart';
import '../../../themes/theme_app.dart';

class AppCupertinoDialog extends StatefulWidget {
  final SettingsCubit settingsCubit;
  final String username;

  const AppCupertinoDialog({
    super.key,
    required this.settingsCubit,
    this.username = '',
  });

  @override
  State<AppCupertinoDialog> createState() => _AppCupertinoDialogState();
}

class _AppCupertinoDialogState extends State<AppCupertinoDialog> {
  late final TextEditingController _textEditingController;

  SettingsCubit get _cubit => widget.settingsCubit;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        context.strings.username,
        style: context.textTheme.subtitle1?.copyWith(fontSize: 20.sp),
      ),
      content: Material(
        color: Colors.transparent,
        child: TextField(
          controller: _textEditingController,
          style: context.textTheme.bodyText2,
          decoration: InputDecoration(
            hintText: context.strings.username,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: context.router.pop,
          child: Text(
            context.strings.cancel,
            style: context.textTheme.bodyText2?.copyWith(
              color: context.colorScheme.surfaceVariant,
              fontSize: 16.sp,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            await context.router.pop();
            _cubit.saveUsername(_textEditingController.text);
          },
          child: Text(
            context.strings.save,
            style: context.textTheme.bodyText2?.copyWith(
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
