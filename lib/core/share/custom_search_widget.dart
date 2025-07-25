import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/share/custom_search_field_text_widge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchWidget extends GetView<BodyHomeControllerImp> {
  const CustomSearchWidget({
    super.key,
    this.isAppearFavorite = true,
    this.autofocus = false,
  });
  final bool isAppearFavorite;
  final bool autofocus;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: CustomSearchFieldTextWidge(
            autofocus: autofocus,
          ),
        ),
        const SizedBox(width: 6),
        isAppearFavorite
            ? IconButton(
                color: colorScheme.primary,
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.surfaceContainerHighest,
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
}
