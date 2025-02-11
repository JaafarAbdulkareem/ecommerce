import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class TitleDescriptionWidget extends StatelessWidget {
  const TitleDescriptionWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyle.styleBold18(context).copyWith(
          color: AppColorText.primary,
        ),
      ),
      subtitle: Text(
        subTitle,
        textAlign: TextAlign.center,
        style: AppStyle.styleLight14(context),
      ),
    );
  }
}
