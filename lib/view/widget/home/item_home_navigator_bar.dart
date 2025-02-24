import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/data/models/home_navigator_bar_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemHomeNavigatorBar extends GetView<HomeControllerImp> {
  const ItemHomeNavigatorBar({
    super.key,
    required this.data,
    required this.selected,
    required this.index,
  });
  final HomeNavigatorBarModel data;
  final bool selected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 67,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.iconColor,
      ),
      child: MaterialButton(
        enableFeedback: false,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        onPressed: () {
          controller.changeBottonBar(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              data.icon,
              color: selected ? AppColor.primary : AppColorText.textButton,
              size: selected ? 32 : 24,
            ),
            selected
                ? const SizedBox()
                : FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      data.title.tr,
                      style: AppStyle.styleSemiBold10(context),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
