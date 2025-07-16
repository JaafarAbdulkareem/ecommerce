import 'package:ecommerce/controller/bottom_bar/setting_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownLanguage extends GetView<SettingControllerImp> {
  const DropDownLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        KeyLanguage.language.tr,
        style: theme.textTheme.displaySmall?.copyWith(
          color: theme.bottomAppBarTheme.shadowColor,
        ),
      ),
      trailing: DropdownButton<String>(
        value: controller.currentLanguage.value,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w300,
            ),
        items: controller.items,
        onChanged: (value) {
          if (value != null) {
            controller.changeLanguage(value);
          }
        },
      ),
    );
  }
}
