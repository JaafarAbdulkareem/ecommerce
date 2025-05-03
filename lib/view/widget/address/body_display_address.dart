import 'package:ecommerce/controller/address/display_address_controller.dart';
import 'package:ecommerce/view/widget/address/item_display_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyDisplayAddressView extends GetView<DisplayAddressControllerImp> {
  const BodyDisplayAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: controller.addressData.length,
        itemBuilder: (context, index) => ItemDisplayAddress(
          data: controller.addressData[index],
          deleteTap: () {
            controller.deleteAddress(index);
          },
        ),
      ),
    );
  }
}
