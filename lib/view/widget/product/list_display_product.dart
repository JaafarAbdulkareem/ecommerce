import 'package:ecommerce/controller/product/product_controller.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/share/out_of_stock_widget.dart';
import 'package:ecommerce/view/widget/product/item_list_display_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDisplayProduct extends GetView<ProductControllerImp> {
  const ListDisplayProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllerImp>(
      builder: (controller) {
        return GridView.builder(
          itemCount: controller.productCategoryData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ConstantScale.crossAxisCount,
          ),
          itemBuilder: (context, index) {
            return controller.productCategoryData[index].active == 0
                ? OutOfStockWidget(
                    child: ItemListDisplayProduct(
                      index: index,
                      data: controller.productCategoryData[index],
                      onTap: () {},
                    ),
                  )
                : ItemListDisplayProduct(
                    index: index,
                    data: controller.productCategoryData[index],
                    onTap: () {
                      controller.goToProductDetail(index);
                    },
                  );
          },
        );
      },
    );
  }
}
