import 'package:ecommerce/controller/checkout/payment_controller.dart';
import 'package:ecommerce/core/constant/app_images.dart';
import 'package:ecommerce/view/widget/checkout/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsListView extends GetView<PaymentControllerImp> {
  const PaymentMethodsListView({super.key});

  final List<String> paymentMethodsItems = const [
    AppImages.imagesCard,
    AppImages.imagesPaypal,
  ];

  // int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: paymentMethodsItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  controller.paymentIndex.value = index;
                },
                child: Obx(() {
                  return PaymentMethodItem(
                    isActive: controller.paymentIndex.value == index,
                    image: paymentMethodsItems[index],
                  );
                }),
              ),
            );
          }),
    );
  }
}
