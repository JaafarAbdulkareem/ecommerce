import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/order/table_invalid_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyInvalidOrderView extends StatelessWidget {
  const BodyInvalidOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          KeyLanguage.productNoNotAvailableMessage.tr,
          style: textTheme.displaySmall, 
          textAlign: TextAlign.center,
        ),
        const Expanded(
          child: TableInvalidOrder(),
        ),
      ],
    );
  }
}
