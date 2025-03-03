import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
    this.isAppearFavorite = true,
  });
  final bool isAppearFavorite;
  @override
  Widget build(BuildContext context) {
    BodyHomeControllerImp controller = Get.find<BodyHomeControllerImp>();
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
        isAppearFavorite
            ? IconButton(
                color: AppColor.primary,
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.backgroundIcon,
                ),
                onPressed: () {
                  controller.goToFavorite();
                },
                icon: const Icon(AppIcon.favoriteBorder),
              )
            : const SizedBox(),
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
