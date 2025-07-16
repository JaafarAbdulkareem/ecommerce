import 'package:ecommerce/controller/cart/coupons_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonCuoponsApply extends StatelessWidget {
  const ButtonCuoponsApply({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: onTap,
      child: GetBuilder<CouponsControllerImp>(
        builder: (controller) {
          return CustomLoadingWidget(
            statusRequest: controller.statusRequest,
            child: Text(
              controller.isApplyCoupons
                  ? KeyLanguage.removeButton.tr
                  : KeyLanguage.applyButton.tr,
              style: theme.textTheme.titleMedium,
            ),
          );
        },
      ),
    );
  }
}
