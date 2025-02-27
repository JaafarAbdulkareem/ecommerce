import 'package:ecommerce/controller/product/product_controller.dart';
import 'package:ecommerce/core/share/custom_search_widget.dart';
import 'package:ecommerce/view/widget/product/list_category_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>ProductControllerImp());
    return const Scaffold(
      body: SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Column(
            children: [
              CustomSearchWidget(),
              ListCategoryBar(),
            ],
          ),
        ),
      ) ,
    );
  }
}