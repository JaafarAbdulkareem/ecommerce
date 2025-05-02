import 'package:ecommerce/controller/address/detail_address_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomButtonNextAddress extends GetView<DetailAddressControllerImp> {
  const BottomButtonNextAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: CustomButtonWidget(
          text: KeyLanguage.saveButton.tr,
          color: AppColor.primary,
          onTap: () {
            controller.saveButton();
          },
        ),
      ),
    );
  }
}
