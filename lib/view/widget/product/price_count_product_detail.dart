import 'package:ecommerce/controller/product/product_detail_controller.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/view/widget/product/price_product_item.dart';
import 'package:ecommerce/view/widget/product/counter_product_detail.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceCountProductDetail extends GetView<ProductDetailControllerImp> {
  const PriceCountProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CounterProductDetail(
        ),
        PriceProductItem(
          price: controller.productDetailData.price,
          discount: controller.productDetailData.discount,
          style: AppStyle.styleRegular14(context).copyWith(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
