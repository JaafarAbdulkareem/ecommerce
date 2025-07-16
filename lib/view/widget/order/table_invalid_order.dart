import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/order/list_invalid_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableInvalidOrder extends StatelessWidget {
  const TableInvalidOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  KeyLanguage.productTitle.tr,
                  style: textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: Text(
                  KeyLanguage.countTitle.tr,
                  style: textTheme.titleLarge,
                ),
              ),
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
            ],
          ),
          const Expanded(
            child: ListInvalidOrder(),
          ),
        ],
      ),
    );
  }
}
