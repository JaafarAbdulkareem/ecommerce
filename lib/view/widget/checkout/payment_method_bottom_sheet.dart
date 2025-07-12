import 'package:ecommerce/controller/checkout/payment_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/data/models/stripe_payment_model/payment_intents/input_payment_intent_model.dart';
import 'package:ecommerce/view/widget/checkout/payment_method_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsBottomSheet extends GetView<PaymentControllerImp> {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          CustomButtonWidget(
            text: KeyLanguage.continueButton.tr,
            color: AppColor.primary,
            onTap: () {
              print("called");
              controller.paymentButton(
                inputPaymentIntentModel: InputPaymentIntentModel(
                  amount: 100,
                  currency: ConstantText.currencyPayment,
                  customer: "cus_Sf1wuhX4jm4uSW",
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
