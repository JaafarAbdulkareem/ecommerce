import 'package:ecommerce/controller/address/detail_address_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/function/validator.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyDetailInsertAddressView extends GetView<DetailAddressControllerImp> {
  const BodyDetailInsertAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.keyDetailAddress,
      child: SingleChildScrollView(
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
                controller: controller.typeAddress,
                keyboardType: TextInputType.text,
                validator: (value) => validatorGeneral(value),
              ),
              CustomTextFormFieldWidget(
                hint: KeyLanguage.cityHint.tr,
                label: KeyLanguage.cityLabel.tr,
                icon: AppIcon.city,
                controller: controller.city,
                keyboardType: TextInputType.text,
                validator: (value) => validatorGeneral(value),
              ),
              CustomTextFormFieldWidget(
                hint: KeyLanguage.streetHint.tr,
                label: KeyLanguage.streetLabel.tr,
                icon: AppIcon.street,
                controller: controller.street,
                keyboardType: TextInputType.text,
                validator: (value) => validatorGeneral(value),
              ),
              CustomTextFormFieldWidget(
                maxLines: null,
                hint: KeyLanguage.detailAddressHint.tr,
                label: KeyLanguage.detailAddressLabel.tr,
                icon: AppIcon.detailAddress,
                controller: controller.detailAddress,
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
