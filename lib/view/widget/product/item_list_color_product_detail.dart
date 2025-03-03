import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class ItemListColorProductDetail extends StatelessWidget {
  const ItemListColorProductDetail({
    super.key,
    required this.select,
    required this.title,
    required this.onTap,
  });
  final bool select;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: select ? AppColorText.titleProductDetail : AppColor.card,
              border: Border.all(
                color: AppColorText.titleProductDetail,
              ),
            ),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: select
                      ? AppStyle.styleSemiBold14(context).copyWith(
                          color: AppColorText.textButton,
                        )
                      : AppStyle.styleSemiBold14(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
