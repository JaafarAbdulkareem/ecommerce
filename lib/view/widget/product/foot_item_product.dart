import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/view/widget/product/rate_item_product.dart';
import 'package:flutter/material.dart';

class FootItemProduct extends StatelessWidget {
  const FootItemProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Icon(
              size: ConstantScale.iconFavorite,
              // selected?
              AppIcon.favorite
              // :
              // AppIcon.favoriteBorder
              ,
              color: // selected?
                  AppColor.favorite
              //  :null,
              //  ,
              ),
        ),
        RateItemProduct(),
      ],
    );
  }
}
