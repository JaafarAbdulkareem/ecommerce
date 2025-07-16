import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/checkout/options_payment_method.dart';
import 'package:ecommerce/view/widget/home/title_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSectionWidget(
          title: KeyLanguage.titlePaymentMethod.tr,
        ),
        const OptionsPaymentMethod(),
      ],
    );
  }
}
