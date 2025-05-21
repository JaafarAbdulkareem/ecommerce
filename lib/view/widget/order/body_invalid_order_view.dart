import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/order/table_invalid_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyInvalidOrderView extends StatelessWidget {
  const BodyInvalidOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          KeyLanguage.productNoNotAvailableMessage.tr,
          style: AppStyle.styleSemiBold14(context),
          textAlign: TextAlign.center,
        ),
        const Expanded(
          child: TableInvalidOrder(),
        ),
      ],
    );
  }
}
