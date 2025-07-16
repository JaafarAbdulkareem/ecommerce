import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/data/models/ads_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemAdsWidget extends GetView<BodyHomeControllerImp> {
  const CustomItemAdsWidget({
    super.key,
    required this.data,
  });
  final AdsHomeModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final ballColor = Color(data.ballColor);
    final backgroundColor = Color(data.background);

    return Card(
      color: backgroundColor,
      child: Stack(
        children: [
          Center(
            child: ListTile(
              title: Text(
                data.name,
                style: textTheme.bodyMedium?.copyWith(color: ballColor),
              ),
              subtitle: Text(
                data.desc,
                style: textTheme.headlineMedium?.copyWith(color: ballColor),
              ),
            ),
          ),
          Positioned(
            top: -8,
            right: controller.language == ConstantLanguage.en ? -25 : null,
            left: controller.language == ConstantLanguage.ar ? -25 : null,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ballColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
