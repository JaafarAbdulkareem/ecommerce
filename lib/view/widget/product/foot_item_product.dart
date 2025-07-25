import 'package:ecommerce/controller/product/product_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/view/widget/product/rate_item_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootItemProduct extends StatelessWidget {
  const FootItemProduct({
    super.key,
    required this.index,
    required this.rating,
  });
  final int index;
  final String rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GetBuilder<ProductControllerImp>(
          id: ConstantKey.idFavoriteProduct,
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                controller.setFavorite(index);
              },
              child: Icon(
                size: ConstantScale.icon,
                controller.productCategoryData[index].isFavorite
                    ? AppIcon.favorite
                    : AppIcon.favoriteBorder,
                color: controller.productCategoryData[index].isFavorite
                    ? AppColor.favorite
                    : null,
              ),
            );
          },
        ),
        RateItemProduct(
          rating: rating,
        ),
      ],
    );
  }
}
