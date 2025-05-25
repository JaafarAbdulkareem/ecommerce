import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/view/widget/order/done_order_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingButton extends StatelessWidget {
  const RatingButton({super.key, required this.isRating, required this.onTap});
  final bool isRating;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 30,
        child: isRating
            ? const DoneOrderRating()
            : CustomButtonWidget(
                text: KeyLanguage.ratingTitle.tr,
                color: AppColor.price,
                onTap: onTap,
              ),
      ),
    );
  }
}
