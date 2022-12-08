import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/settings/settings_cubit.dart';
import '../../../../l10n/localization_helper.dart';
import '../../../../themes/theme_app.dart';

class UsernameCard extends StatefulWidget {
  const UsernameCard({super.key});

  @override
  State<UsernameCard> createState() => _UsernameCardState();
}

class _UsernameCardState extends State<UsernameCard> {
  late final TextEditingController _textEditingController;
  SettingsCubit get _cubit => context.read();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(
      text: _cubit.state.settings.userName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person),
      trailing: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: context.colorScheme.secondary,
        ),
        onPressed: () => _cubit.saveUsername(_textEditingController.text),
        child: Text(
          context.strings.save,
          style: context.textTheme.headline1,
        ),
      ),
      title: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          hintText: context.strings.username,
        ),
      ),
    );
  }
}
