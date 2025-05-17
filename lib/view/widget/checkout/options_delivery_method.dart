import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/constant/app_images.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/checkout/item_delivery_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionsDeliveryMethod extends StatelessWidget {
  const OptionsDeliveryMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutControllerImp>(
      id: ConstantKey.idDeliveryType,
      builder: (controller) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 14),
              ItemDeliveryMethod(
                text: KeyLanguage.deliveryOption.tr,
                image: AppImages.imagesDelivery,
                isActive:
                    ConstantScale.deliveryOption == controller.deliveryType,
                onTap: () {
                  controller.chooseDeliveryType(ConstantScale.deliveryOption);
                },
              ),
              const SizedBox(width: 8),
              ItemDeliveryMethod(
                text: KeyLanguage.receiveOption.tr,
                image: AppImages.imagesReceive,
                isActive:
                    ConstantScale.receiveOption == controller.deliveryType,
                onTap: () {
                  controller.chooseDeliveryType(ConstantScale.receiveOption);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
