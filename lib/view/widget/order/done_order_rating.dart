import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoneOrderRating extends StatelessWidget {
  const DoneOrderRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColor.secondary,
      ),
      onPressed: null,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          KeyLanguage.ratingTitle.tr,
          style: AppStyle.styleBold16(context),
        ),
      ),
    );
  }
}
