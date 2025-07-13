import 'package:ecommerce/controller/checkout/payment_controller.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/view/widget/checkout/payment_method_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
          GetBuilder<PaymentControllerImp>(
            builder: (contorller) {
              return contorller.statusRequest == StatusRequest.loading
                  ? SizedBox(
                      height: 65,
                      child: Lottie.asset(
                        AppLottie.loading,
                      ),
                    )
                  : CustomButtonWidget(
                      text: KeyLanguage.continueButton.tr,
                      color: AppColor.primary,
                      onTap: () {
                        controller.paymentButton();
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
