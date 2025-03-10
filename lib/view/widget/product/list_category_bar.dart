import 'package:ecommerce/controller/product/product_controller.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/view/widget/product/item_list_categery_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoryBar extends GetView<ProductControllerImp> {
  const ListCategoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.categoryNames.asMap().entries.map(
            (e) {
              int index = e.key;
              return GetBuilder<ProductControllerImp>(
                builder: (controller) => ItemListCategeryBar(
                  name: translateLanguage(
                    arabic: e.value.arabicName,
                    english: e.value.englishName,
                  ),
                  onTap: () {
                    controller.changeCategory(index);
                  },
                  selected: index == controller.indexCategory,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
