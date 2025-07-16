import 'package:ecommerce/controller/order/archive_order_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalPriceArchiveOrder extends GetView<ArchiveOrderControllerImp> {
  const TotalPriceArchiveOrder({
    super.key,
    required this.id,
    required this.totalPriceText,
  });

  final int id;
  final String totalPriceText;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;

    // Gender-based theming support
    final bool isMale = Get.isRegistered<ArchiveOrderControllerImp>()
        ? Get.find<ArchiveOrderControllerImp>().isMale
        : true; // fallback to male if not found

    final Color genderAccentColor =
        isMale ? AppColor.maleAccent : AppColor.femaleAccent;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${KeyLanguage.totalPriceTitle.tr} : $totalPriceText${ConstantText.currencyPrice}",
          style: textStyle,
        ),
        CustomButtonWidget(
          text: KeyLanguage.detailButton.tr,
          color: genderAccentColor,
          onTap: () {
            controller.goToDetailArchiveOrder(id);
          },
        ),
      ],
    );
  }
}
