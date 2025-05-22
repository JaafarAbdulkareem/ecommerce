import 'package:ecommerce/controller/order/detail_order_controller.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressDetailOrder extends GetView<DetailOrderControllerImp> {
  const ShippingAddressDetailOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "${KeyLanguage.addressTitle.tr} : ",
          style: AppStyle.styleSemiBold14(context),
        ),
        Text(
          "${controller.detailOrderData.address!.city} ${controller.detailOrderData.address!.street}",
          style: AppStyle.styleLight14(context),
        )
      ],
    );
  }
}
