import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/app_controller/app_controller_cubit.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/localization_helper.dart';
import '../../../../themes/theme_app.dart';
import '../../../views/base_builders/app_builder.dart';
import '../../../views/bottom_sheet/app_bottom_sheet.dart';
import 'settings_list_tile.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  Future<Locale?> _showLanguageDialog(
    BuildContext context,
    Locale? currentLocale,
  ) async {
    final action = AppBottomSheet<Locale?>.of(context);
    final selectedLocale = await action.showBottomSheet(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: AppLocalizations.supportedLocales.map((locale) {
          return _buildLanguageTile(
            context: context,
            locale: locale,
            current: currentLocale == locale,
          );
        }).toList(),
      ),
    );
    if (currentLocale == selectedLocale) return null;

    return selectedLocale;
  }

  @override
  Widget build(BuildContext context) {
    return AppBuilder<AppControllerCubit, AppControllerState>(
      withoutScaffold: true,
      withErrorBuilder: false,
      builder: (controlState) {
        final currentLocale = controlState.locale;
        return SettingsListTile(
          asset: Assets.svg.languageIcon,
          title: context.strings.language,
          subtitle: getLocaleName(currentLocale),
          onTap: () async {
          final cubit = context.read<AppControllerCubit>();
          final locale = await _showLanguageDialog(context, currentLocale);

          if (locale == null) return;

          await cubit.changeLanguage(locale);
        },
        );
      },
    );
  }

  Widget _buildLanguageTile({
    required BuildContext context,
    required Locale locale,
    bool current = false,
  }) {
    final theme = context.colorScheme;
    final textColor = current ? theme.primary : theme.onSecondary;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(locale);
      },
      child: ListTile(
        textColor: textColor,
        title: Text(getLocaleName(locale)),
      ),
    );
  }
}
