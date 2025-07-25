import 'package:ecommerce/controller/order/detail_order_controller.dart';
import 'package:ecommerce/view/widget/order/table_detail_archive_order.dart';
import 'package:ecommerce/view/widget/order/total_price_detail_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyDetailArchiveOrderView extends GetView<DetailOrderControllerImp> {
  const BodyDetailArchiveOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        color: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TableDetailArchiveOrder(),
                const SizedBox(height: 16),
                TotalPriceDetailOrder(
                  price: controller.detailOrderData.price,
                  totalPrice: controller.detailOrderData.totalPrice,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
