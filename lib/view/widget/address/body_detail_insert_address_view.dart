import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyDetailInsertAddressView extends StatelessWidget {
  const BodyDetailInsertAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Column(
          children: [
            CustomTextFormFieldWidget(
              hint: KeyLanguage.typeAddressHint.tr,
              label: KeyLanguage.typeAddressLabel.tr,
              icon: AppIcon.typeAddress,
              controller: TextEditingController(),
            ),
            CustomTextFormFieldWidget(
              hint: KeyLanguage.cityHint.tr,
              label: KeyLanguage.cityLabel.tr,
              icon: AppIcon.city,
              controller: TextEditingController(),
            ),
            CustomTextFormFieldWidget(
              hint: KeyLanguage.streetHint.tr,
              label: KeyLanguage.streetLabel.tr,
              icon: AppIcon.street,
              controller: TextEditingController(),
            ),
            CustomTextFormFieldWidget(
              maxLines: null,
              hint: KeyLanguage.detailAddressHint.tr,
              label: KeyLanguage.detailAddressLabel.tr,
              icon: AppIcon.detailAddress,
              controller: TextEditingController(),
            ),
           
          ],
        ),
      ),
    );
  }
}


// CustomTextFormFieldWidget(
//       hint: KeyLanguage.typeAddressHint.tr,
//       label: KeyLanguage.typeAddressLabel.tr,
//       icon: AppIcon.typeAddress,
//       controller: controller.typeAddress,
//     ),
//     CustomTextFormFieldWidget(
//       hint: KeyLanguage.cityHint.tr,
//       label: KeyLanguage.cityLabel.tr,
//       icon: AppIcon.city,
//       controller: controller.city,
//     ),
//     CustomTextFormFieldWidget(
//       hint: KeyLanguage.streetHint.tr,
//       label: KeyLanguage.streetLabel.tr,
//       icon: AppIcon.street,
//       controller: controller.street,
//     ),
//     CustomTextFormFieldWidget(
//       hint: KeyLanguage.detailAddressHint.tr,
//       label: KeyLanguage.detailAddressLabel.tr,
//       icon: AppIcon.detailAddress,
//       controller: controller.detailAddress,
//     ),