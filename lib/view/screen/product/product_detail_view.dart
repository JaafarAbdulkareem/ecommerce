import 'package:ecommerce/controller/product/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/view/widget/product/body_product_detail.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductDetailControllerImp());

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: const SafeArea(
        child: BodyProductDetail(),
      ),
    );
  }
}
