import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleSelectListCart extends StatelessWidget {
  const TitleSelectListCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColor.iconColor,
        borderRadius: BorderRadius.circular(32),
      ),
      alignment: Alignment.center,
      //update 3 sansa
      child: Text(
        "${KeyLanguage.youHave.tr} 3 ${KeyLanguage.listITemCart.tr}",
        style: AppStyle.styleSemiBold14(context),
      ),
    );
  }
}
