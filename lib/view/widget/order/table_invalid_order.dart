import 'package:ecommerce/core/constant/app_style.dart';
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
                  style: AppStyle.styleSemiBold16(context),
                ),
              ),
              Expanded(
                child: Text(
                  KeyLanguage.countTitle.tr,
                  style: AppStyle.styleSemiBold16(context),
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
