import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/function/improve_price.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/cart/text_receive_shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveShoppingCard extends StatelessWidget {
  const ReceiveShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      id: ConstantKey.idReceiveShopping,
      builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: ShapeDecoration(
            shape: Border.all(
              color: AppColor.primary,
            ),
          ),
          child: Column(
            children: [
              TextReceiveShoppingCard(
                title: KeyLanguage.priceTitle.tr,
                receiveAmount: controller.price,
              ),
              controller.couponsController.isApplyCoupons
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          KeyLanguage.couponsDiscount.tr,
                        ),
                        Text(
                          improvePrice(amount: controller.couponsDiscount),
                          style: AppStyle.styleRegular14(context).copyWith(
                            fontFamily: ConstantTextFons.sans,
                            decorationThickness: 3,
                            color: AppColor.wrong,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              TextReceiveShoppingCard(
                title: KeyLanguage.shoppingTitle.tr,
                receiveAmount: controller.shopping,
              ),
              const Divider(),
              TextReceiveShoppingCard(
                title: KeyLanguage.totalPriceTitle.tr,
                receiveAmount: controller.totalPrice,
              ),
            ],
          ),
        );
      },
    );
  }
}
