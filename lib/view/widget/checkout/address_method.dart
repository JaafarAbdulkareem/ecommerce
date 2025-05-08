import 'package:ecommerce/controller/checkout/checkout_controller.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/checkout/empty_address_checkout.dart';
import 'package:ecommerce/view/widget/checkout/title_checkout.dart';
import 'package:ecommerce/view/widget/checkout/options_address_method.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddressMethod extends StatelessWidget {
  const AddressMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutControllerImp>(
      id: ConstantKey.idDeliveryType,
      builder: (controller) {
        return ConstantKey.deliveryOption == controller.deliveryType
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleCheckout(
                    title: KeyLanguage.titleShoppingAddress.tr,
                  ),
                  CheckoutControllerImp.addressData.isEmpty
                      ? EmptyAddressCheckout(
                          onTap: () {},
                        )
                      : const OptionsAddressMethod(),
                  const SizedBox(height: 6),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
