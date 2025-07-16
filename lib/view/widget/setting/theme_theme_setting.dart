import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/setting/drop_down_language.dart';
import 'package:ecommerce/view/widget/setting/item_theme_mode_setting.dart';
import 'package:ecommerce/view/widget/setting/switch_theme_gender.dart';
import 'package:ecommerce/view/widget/setting/switch_theme_mode.dart';
import 'package:flutter/material.dart';

class ThemeModeSettings extends StatelessWidget {
  const ThemeModeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ItemThemeModeSetting(
          title: KeyLanguage.darkMode,
          switchWidget: SwichThemeMode(),
        ),
        ItemThemeModeSetting(
          title: KeyLanguage.genderMode,
          switchWidget: SwitchThemeGender(),
        ),
        DropDownLanguage(),
      ],
    );
  }
}
