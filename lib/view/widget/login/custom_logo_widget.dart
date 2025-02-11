import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class CustomLogoWidget extends StatelessWidget {
  const CustomLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AspectRatio(
        aspectRatio: 1,
        child: CircleAvatar(
          backgroundColor: AppColor.primary,
          child: Image.asset(
            AppImages.imagesLogo,
            fit: BoxFit.fill,
            alignment: Alignment.center,
            width: 80,
          ),
        ),
      ),
    );
  }
}
