import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class SliderPageViewItem extends StatelessWidget {
  const SliderPageViewItem({
    super.key,
    required this.data,
  });
  final OnboardingModel data;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          data.title,
          style: AppStyle.styleBold20(context),
        ),
        const SizedBox(height: 64),
        Image.asset(data.image),
        const SizedBox(height: 64),
        Text(
          data.body,
          style: AppStyle.styleBold14(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
