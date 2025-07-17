import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/commant_checkout_choose.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/models/order_model/order_model.dart';
import 'package:ecommerce/view/widget/order/text_item_order.dart';
import 'package:ecommerce/view/widget/order/total_price_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListOrder extends StatelessWidget {
  const ItemListOrder({
    super.key,
    required this.data,
  });
  final OrderModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      color: theme.cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.s,
          children: [
            Text(
              "${KeyLanguage.orderNumber.tr}${data.id}",
              style: textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            TextItemOrder(
              text:
                  "${KeyLanguage.orderType.tr}${commantDeliveryChoose(data.typeDelivery)}",
            ),
            TextItemOrder(
              text:
                  "${KeyLanguage.orderPrice.tr}${data.price}${ConstantText.currencyPrice}",
            ),
            TextItemOrder(
              text:
                  "${KeyLanguage.deliveyPrice.tr}${data.deliveryPrice}${ConstantText.currencyPrice}",
            ),
            TextItemOrder(
              text:
                  "${KeyLanguage.paymentMethod.tr}${commantPaymentChoose(data.typePayment)}",
            ),
            TextItemOrder(
              text:
                  "${KeyLanguage.orderStatus.tr}${commantOrderStatus(data.status ?? 0)}",
            ),
            const Divider(),
            TotalPriceOrder(
              id: data.id,
              totalPrice: data.totalPrice,
              status: data.status ?? ConstantScale.approvedOption,
            ),
          ],
        ),
      ),
    );
  }
}
