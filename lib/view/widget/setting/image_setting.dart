import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class ImageSetting extends StatelessWidget {
  const ImageSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const AspectRatio(
          aspectRatio: 5.5,
          child: ColoredBox(
            color: AppColor.primary,
          ),
        ),
        AspectRatio(
          aspectRatio: 3,
          child: CircleAvatar(
            backgroundColor: AppColor.card,
            child: CircleAvatar(
              radius: 55,
              child: ClipOval(
                child: Image.asset(
                  AppImages.imagesDragon,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
