import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';

class SwipeDeleteIcon extends StatelessWidget {
  const SwipeDeleteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      AppIcon.deleteSwipe,
      size: ConstantScale.iconDelete,
      color: AppColor.iconDelete,
    );
  }
}
