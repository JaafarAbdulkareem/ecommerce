import 'package:ecommerce/controller/favorite/favorite_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/view/widget/product/rate_item_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootItemProduct extends StatelessWidget {
  const FootItemProduct({
    super.key,
    required this.indexProduct,
  });
  final int indexProduct;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<FavoriteControllerImp>(
            init: FavoriteControllerImp(),
            builder: (controller) {
              return InkWell(
                onTap: () {
                  controller.setFavorite(indexProduct);
                },
                child: Icon(
                  size: ConstantScale.iconFavorite,
                  controller.favoriteData[indexProduct].isFavorite
                      ? AppIcon.favorite
                      : AppIcon.favoriteBorder,
                  color: controller.favoriteData[indexProduct].isFavorite
                      ? AppColor.favorite
                      : null,
                ),
              );
            }),
        RateItemProduct(),
      ],
    );
  }
}
