import 'package:ecommerce/controller/product/product_detail_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/view/widget/product/body_product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductDetailControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundScaffold,
      body: SafeArea(
        child: BodyProductDetail(),
      ),
    );
  }
}
