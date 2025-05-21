import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/core/share/custom_button_widget.dart';
import 'package:ecommerce/data/models/order_model/invalid_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListInvalidOrder extends StatelessWidget {
  const ItemListInvalidOrder({super.key, required this.data});
  final InvalidOrderModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.card,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                data.name,
                style: AppStyle.styleSemiBold16(context)
                    .copyWith(color: AppColorText.titleArchive),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(width: 22),
            Expanded(
              child: Text(
                data.count.toString(),
                style: AppStyle.styleSemiBold16(context)
                    .copyWith(color: AppColorText.titleArchive),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                      text: KeyLanguage.injectButton.tr,
                      color: AppColor.wrong,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: CustomButtonWidget(
                      text: KeyLanguage.acceptButton.tr,
                      color: AppColor.price,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
