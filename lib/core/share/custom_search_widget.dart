import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              prefixIcon: const Icon(
                AppIcon.search,
                size: 20,
              ),
              hintText: KeyLanguage.searchHint.tr,
              hintStyle: AppStyle.styleBold12(context),
              border: border(),
              enabledBorder: border(),
              focusedBorder: border(),
            ),
          ),
        ),
        const SizedBox(width: 6),
        IconButton(
          color: AppColor.primary,
          style: IconButton.styleFrom(
            backgroundColor: AppColor.backgroundIcon,
          ),
          onPressed: () {},
          icon: const Icon(AppIcon.notification),
        ),
      ],
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: AppColor.primary),
    );
  }
}
