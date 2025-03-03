import 'package:ecommerce/controller/product/product_detail_controller.dart';
import 'package:ecommerce/view/widget/product/item_list_color_product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListColorProductDetail extends StatelessWidget {
  const ListColorProductDetail({super.key});
  //remove
  static List<String> colorData = [
    "Red",
    "White",
    "Black",
    "Blue",
  ];
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5.5,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: colorData
              .asMap()
              .entries
              .map(
                (e) => GetBuilder<ProductDetailControllerImp>(
                  builder: (controller) {
                    return ItemListColorProductDetail(
                      select: e.key == controller.indexColor,
                      title: e.value,
                      onTap: () {
                        controller.transactionColor(e.key);
                      },
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
