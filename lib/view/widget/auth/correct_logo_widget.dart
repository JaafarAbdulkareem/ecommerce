import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:flutter/material.dart';

class CorrectLogoWidget extends StatelessWidget {
  const CorrectLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: AspectRatio(
        aspectRatio: 1,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Icon(
            AppIcon.success,
            color: AppColor.correct,
          ),
        ),
      ),
    );
  }
}
