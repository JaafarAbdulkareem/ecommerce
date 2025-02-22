import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleSectionWidget extends StatelessWidget {
  const TitleSectionWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr,
      style: AppStyle.styleSemibold18(context),
    );
  }
}