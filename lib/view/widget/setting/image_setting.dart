import 'package:ecommerce/core/constant/app_images.dart';
import 'package:flutter/material.dart';

class ImageSetting extends StatelessWidget {
  const ImageSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AspectRatio(
          aspectRatio: 5.5,
          child: ColoredBox(
            color: theme.colorScheme.primary,
          ),
        ),
        Positioned.fill(
          top: 20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: theme.cardColor,
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    AppImages.imagesDragon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
