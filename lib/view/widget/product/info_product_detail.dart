import 'package:ecommerce/controller/product/product_detail_controller.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/view/widget/product/color_product_detail.dart';
import 'package:ecommerce/view/widget/product/price_count_product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoProductDetail extends GetView<ProductDetailControllerImp> {
  const InfoProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translateLanguage(
              arabic: controller.productDetailData.arabicName,
              english: controller.productDetailData.englishName,
            ),
            style: AppStyle.styleSemiBold20(context),
          ),
          const PriceCountProductDetail(),
          Text(
            translateLanguage(
              arabic: controller.productDetailData.arabicDescription,
              english: controller.productDetailData.englishDescription,
            ),
            style: AppStyle.styleBold12(context),
            textAlign: TextAlign.justify,
          ),
          const ColorProductDetail(),
        ],
      ),
    );
  }
}
