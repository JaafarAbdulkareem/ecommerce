import 'package:ecommerce/controller/order/detail_order_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/order/rating_button.dart';
import 'package:ecommerce/view/widget/order/text_item_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableDetailArchiveOrder extends StatelessWidget {
  const TableDetailArchiveOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailOrderControllerImp>(
      id: ConstantKey.idRatingButton,
      builder: (controller) {
        return Table(
          children: [
            TableRow(
              children: [
                TextItemOrder(text: KeyLanguage.productTitle.tr),
                TextItemOrder(text: KeyLanguage.quantityTitle.tr),
                TextItemOrder(text: KeyLanguage.priceTitle.tr),
                TextItemOrder(text: KeyLanguage.ratingTitle.tr),
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
                  RatingButton(
                    isRating:
                        controller.detailOrderData.productsData[index].rating,
                    onTap: () {
                      controller.getProductRating(
                        context: context,
                        index: index,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
