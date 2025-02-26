import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/home/item_category_list_view.dart';
import 'package:ecommerce/view/widget/home/title_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListView extends GetView<BodyHomeControllerImp> {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleSectionWidget(title: KeyLanguage.titleCategories),
        SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categoryData.length,
            itemBuilder: (context, index) {
              return ItemCategoryListView(
                data: controller.categoryData[index],
                onTap: () {
                 controller.navigatorToProduct(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
