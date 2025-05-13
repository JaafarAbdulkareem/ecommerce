import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/order/text_item_order.dart';
import 'package:ecommerce/view/widget/order/total_price_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListOrder extends StatelessWidget {
  const ItemListOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${KeyLanguage.orderNumber.tr}12",
              style: AppStyle.styleSemiBold16(context)
                  .copyWith(color: AppColorText.titleArchive),
            ),
            const SizedBox(height: 12),
            TextItemOrder(text: "${KeyLanguage.orderType.tr}Delivery"),
            TextItemOrder(
                text:
                    "${KeyLanguage.orderPrice.tr}100${ConstantText.currencyPrice}"),
            TextItemOrder(
                text:
                    "${KeyLanguage.deliveyPrice.tr}10${ConstantText.currencyPrice}"),
            TextItemOrder(text: "${KeyLanguage.paymentMethod.tr}Cash"),
            const Divider(),
            const TotalPriceDetails(totalPriceText: "16"),
          ],
        ),
      ),
    );
  }
}
