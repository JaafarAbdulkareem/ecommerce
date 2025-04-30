import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyInsertAddressView extends StatelessWidget {
  const BodyInsertAddressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: CustomButtonWidget(
            text: KeyLanguage.nextButton.tr,
            color: AppColor.primary,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
