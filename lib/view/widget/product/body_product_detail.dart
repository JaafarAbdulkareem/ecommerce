import 'package:ecommerce/controller/product/product_detail_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/view/widget/product/description_product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyProductDetail extends GetView<ProductDetailControllerImp> {
  const BodyProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: DescriptionProductDetail(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomButtonWidget(
            text: KeyLanguage.goToCartButton.tr,
            color: AppColor.primary,
            onTap: () {
              controller.goToCart();
            },
          ),
        ),
      ],
    );
  }
}
