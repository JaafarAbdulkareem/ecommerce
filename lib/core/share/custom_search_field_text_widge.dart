import 'package:ecommerce/controller/search/search_product_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFieldTextWidge extends StatelessWidget {
  const CustomFieldTextWidge({
    super.key,
    this.autofocus = false,
  });
  final bool autofocus;
  @override
  Widget build(BuildContext context) {
    SearchProductControllerImp controller =
        Get.find<SearchProductControllerImp>();
    return TextFormField(
      controller: controller.textController,
      autofocus: autofocus,
      onFieldSubmitted: (value) {
        controller.onSearch();
      },
      onChanged: (value) {
        controller.onChange(value);
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ),
        prefixIcon: IconButton(
          onPressed: () {
            controller.onSearch();
          },
          icon: const Icon(
            AppIcon.search,
            size: 20,
          ),
        ),
        hintText: KeyLanguage.searchHint.tr,
        hintStyle: AppStyle.styleBold12(context),
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: AppColor.primary),
    );
  }
}
