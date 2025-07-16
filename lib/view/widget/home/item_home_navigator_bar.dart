import 'package:ecommerce/controller/home/home_controller.dart';
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
    final theme = Theme.of(context);
    final bottomAppBarTheme = theme.bottomAppBarTheme;
    final textTheme = theme.textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bottomAppBarTheme.surfaceTintColor,
      ),
      child: MaterialButton(
        enableFeedback: false,
        padding: EdgeInsets.zero,
        onPressed: () {
          controller.changeBottonBar(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              data.icon,
              color: bottomAppBarTheme.shadowColor,
              size: selected ? 45 : 32,
            ),
            if (!selected)
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  data.title.tr,
                  style: textTheme.labelLarge?.copyWith(
                    color: bottomAppBarTheme.shadowColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
