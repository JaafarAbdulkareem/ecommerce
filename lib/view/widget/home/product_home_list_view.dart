import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/home/item_product_home_list_view.dart';
import 'package:ecommerce/view/widget/home/title_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductHomeListView extends GetView<BodyHomeControllerImp> {
  const ProductHomeListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleSectionWidget(title: KeyLanguage.titleDiscountProduct),
        const SizedBox(height: 6),
        AspectRatio(
          aspectRatio: 2.8,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.discountProductData.length,
            itemBuilder: (context, index) => AspectRatio(
              aspectRatio: 2,
              child: ItemProductHomeListView(
                data: controller.discountProductData[index],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
