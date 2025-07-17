import 'package:ecommerce/controller/order/order_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/improve_price.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalPriceOrder extends GetView<OrderControllerImp> {
  const TotalPriceOrder({
    super.key,
    required this.id,
    required this.totalPrice,
    required this.status,
  });

  final int id, status;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w500,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text("${KeyLanguage.totalPriceTitle.tr} : "),
            Text(
              improvePrice(amount: totalPrice),
              style: textStyle,
            ),
          ],
        ),
        const SizedBox(width: 6),
        if (status < ConstantScale.prepareOption)
          Expanded(
            child: CustomButtonWidget(
              text: KeyLanguage.deleteButton.tr,
              color: AppColor.wrong,
              onTap: () {
                controller.deleteOrder(id);
              },
            ),
          ),
        const SizedBox(width: 6),
        Expanded(
          child: CustomButtonWidget(
            text: KeyLanguage.detailButton.tr,
            onTap: () {
              controller.goToDetailOrder(id);
            },
          ),
        ),
      ],
    );
  }
}
