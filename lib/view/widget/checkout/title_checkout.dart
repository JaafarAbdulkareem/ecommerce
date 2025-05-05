import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class TitleCheckout extends StatelessWidget {
  const TitleCheckout({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:  12),
      child: Text(
        title,
        style: AppStyle.styleSemiBold16(context).copyWith(
          color: AppColorText.titleProductDetail,
        ),
      ),
    );
  }
}
