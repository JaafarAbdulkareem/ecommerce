import 'package:ecommerce/controller/product/product_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/share/custom_search_widget.dart';
import 'package:ecommerce/view/widget/home/home_status_view.dart';
import 'package:ecommerce/view/widget/product/list_category_bar.dart';
import 'package:ecommerce/view/widget/product/list_display_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundScaffold,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Column(
            children: [
              const CustomSearchWidget(),
              const ListCategoryBar(),
              GetBuilder<ProductControllerImp>(
                builder: (controller) {
                  return HomeStatusView(
                    statusRequest: controller.statusRequest,
                    child: const Expanded(
                      child: ListDisplayProduct(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
