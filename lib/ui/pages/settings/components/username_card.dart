import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../l10n/localization_helper.dart';
import '../../../../themes/theme_app.dart';
import '../../../views/dialogs/app_cupertino_dialog.dart';

class UsernameCard extends StatelessWidget {
  final String username;

  const UsernameCard({
    super.key,
    this.username = '',
  });

  @override
  Widget build(BuildContext context) {
    var username = this.username;
    if (username.isEmpty) username = context.strings.guest;
    return GestureDetector(
      onTap: () {
        showCupertinoDialog(
          context: context,
          builder: (dialogContext) {
            return AppCupertinoDialog(
              settingsCubit: context.read(),
              username: this.username,
            );
          },
        );
      },
      child: ListTile(
        leading: SvgPicture.asset(
          Assets.svg.usernameIcon,
          width: 20,
          color: context.colorScheme.secondaryContainer,
        ),
        title: Text(context.strings.username),
        subtitle: Text(username),
      ),
    );
  }
}
