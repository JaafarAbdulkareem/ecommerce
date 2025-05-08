import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/view/widget/checkout/item_address_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OptionsAddressMethod extends StatelessWidget {
  const OptionsAddressMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutControllerImp>(
      id: ConstantKey.idAddressType,
      builder: (controller) {
        return Padding(
          padding: controller.language == ConstantLanguage.en
              ? const EdgeInsets.only(left: 12, right: 4)
              : const EdgeInsets.only(left: 4, right: 12),
          child: Column(
            children: CheckoutControllerImp.addressData
                .map(
                  (e) => ItemAddressMethod(
                    data: e,
                    isActive: controller.idAddress == e.id,
                    onTap: () {
                      controller.chooseAddressMethod(e.id);
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
