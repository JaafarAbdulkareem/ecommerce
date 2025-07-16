import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/localization/key_language.dart';

class DoneOrderRating extends StatelessWidget {
  const DoneOrderRating({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
      ),
      onPressed: null,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          KeyLanguage.ratingTitle.tr,
          style: theme.textTheme.headlineSmall, // previously AppStyle.styleBold16
        ),
      ),
    );
  }
}
