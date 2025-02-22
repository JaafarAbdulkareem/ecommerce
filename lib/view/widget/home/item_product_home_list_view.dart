import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_images.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class ItemProductHomeListView extends StatelessWidget {
  const ItemProductHomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          color: AppColor.backgroundHomeProduct,
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppImages.images1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Mobile Samsung S3",
                style: AppStyle.styleBold16(context),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
