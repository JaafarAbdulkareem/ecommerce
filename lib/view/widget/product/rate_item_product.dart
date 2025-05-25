import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';

class RateItemProduct extends StatelessWidget {
  const RateItemProduct({super.key, required this.rating});
final String rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rating),
        // ...List.generate(
        //   ConstantScale.noStar,
        //   (index) {
        //     return
        Icon(
          size: ConstantScale.iconStar,
          AppIcon.star,
          color: AppColor.star,
        )
        // ;
        //   },
        // ),
      ],
    );
  }
}
