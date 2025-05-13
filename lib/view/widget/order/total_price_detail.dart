import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalPriceDetails extends StatelessWidget {
  const TotalPriceDetails({super.key, required this.totalPriceText});
final String totalPriceText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${KeyLanguage.totalPrice.tr} : $totalPriceText${ConstantText.currencyPrice}",
          style: AppStyle.styleSemiBold14(context),
        ),
        CustomButtonWidget(
          text: KeyLanguage.detailButton.tr,
          color: AppColor.iconColor,
          onTap: () {},
        ),
      ],
    );
  }
}
