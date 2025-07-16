import 'package:ecommerce/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderPageViewItem extends StatelessWidget {
  const SliderPageViewItem({
    super.key,
    required this.data,
  });
  final OnboardingModel data;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          data.title.tr,
          style:
              textTheme.displayLarge
        ),
        const SizedBox(height: 32),
        Image.asset(data.image),
        const SizedBox(height: 32),
        Text(
          data.body.tr,
          style: textTheme.bodyMedium,//?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
