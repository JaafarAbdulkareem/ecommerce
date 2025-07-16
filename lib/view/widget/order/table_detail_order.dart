import 'package:ecommerce/controller/order/detail_order_controller.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/order/text_item_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableDetailOrder extends GetView<DetailOrderControllerImp> {
  const TableDetailOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 150,
          ),
          child: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                children: [
                  TextItemOrder(text: KeyLanguage.productTitle.tr),
                  TextItemOrder(text: KeyLanguage.quantityTitle.tr),
                  TextItemOrder(text: KeyLanguage.priceTitle.tr),
                ],
              ),
              ...List.generate(
                controller.detailOrderData.productsData.length,
                (index) => TableRow(
                  children: [
                    Text(
                      translateLanguage(
                        arabic: controller
                            .detailOrderData.productsData[index].arabicName,
                        english: controller
                            .detailOrderData.productsData[index].englishName,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      controller.detailOrderData.productsData[index].count
                          .toString(),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      controller.detailOrderData.productsData[index].totalPrice
                          .toString(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
