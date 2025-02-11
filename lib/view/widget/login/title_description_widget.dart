import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleDescriptionWidget extends StatelessWidget {
  const TitleDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        KeyLanguage.welcome.tr,
        textAlign: TextAlign.center,
        style: AppStyle.styleBold18(context).copyWith(
          color: AppColorText.primary,
        ),
      ),
      subtitle: Text(
        KeyLanguage.loginContent.tr,
        textAlign: TextAlign.center,
        style: AppStyle.styleLight14(context),
      ),
    );
  }
}
