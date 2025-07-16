import 'package:ecommerce/controller/product/product_detail_controller.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/view/widget/product/color_product_detail.dart';
import 'package:ecommerce/view/widget/product/price_count_product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoProductDetail extends GetView<ProductDetailControllerImp> {
  const InfoProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translateLanguage(
                arabic: controller.productDetailData.arabicName,
                english: controller.productDetailData.englishName,
              ),
              style: textTheme.displayLarge,
            ),
            const PriceCountProductDetail(),
            Text(
              translateLanguage(
                arabic: controller.productDetailData.arabicDescription,
                english: controller.productDetailData.englishDescription,
              ),
              style: textTheme.titleLarge,
              textAlign: TextAlign.justify,
            ),
            const ColorProductDetail(),
          ],
        ),
      ),
    );
  }
}
