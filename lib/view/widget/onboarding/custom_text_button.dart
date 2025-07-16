import 'package:ecommerce/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextButton extends GetView<LocaleController> {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.codeLanguage,
  });
  final String text, codeLanguage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
        ),
        onPressed: () async {
          await controller.goToOnboarding(codeLanguage);
        },
        child: Text(
          text.tr,
          style: theme.textTheme.titleMedium,
        ),
      ),
    );
  }
}
