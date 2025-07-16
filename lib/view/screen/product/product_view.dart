import 'package:ecommerce/controller/product/product_controller.dart';
import 'package:ecommerce/controller/search/search_product_controller.dart';
import 'package:ecommerce/core/share/custom_search_widget.dart';
import 'package:ecommerce/view/widget/search/body_search_view.dart';
import 'package:ecommerce/view/widget/product/body_product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductControllerImp());

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Column(
            children: [
              const CustomSearchWidget(),
              GetBuilder<SearchProductControllerImp>(
                builder: (searchController) {
                  return searchController.isSearch
                      ? const BodySearchView()
                      : const Expanded(
                          child: BodyProductView(),
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
