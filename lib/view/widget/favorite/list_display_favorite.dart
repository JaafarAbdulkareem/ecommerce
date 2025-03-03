import 'package:ecommerce/controller/favorite/favorite_controller.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/view/widget/favorite/item_list_display_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDisplayFavorite extends GetView<FavoriteControllerImp> {
  const ListDisplayFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.favoriteData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ConstantScale.crossAxisCount,
      ),
      itemBuilder: (context, index) {
        return ItemListDisplayFavorite(
          data: controller.favoriteData[index],
          onTap: () {
            controller.goToPrductDetail(index);
          },
        );
      },
    );
  }
}
