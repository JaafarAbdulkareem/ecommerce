import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:flutter/material.dart';

class RateItemProduct extends StatelessWidget {
  const RateItemProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("3.5"),
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
