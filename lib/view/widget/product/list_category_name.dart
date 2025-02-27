import 'package:ecommerce/controller/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoryName extends GetView<ProductControllerImp> {
  const ListCategoryName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: controller.categoryNames.asMap().entries.map((e){
        int i = e.key;
        print("i : $i");
return Text(e.value.englishName);
      }).toList() ,
    );
  }
}