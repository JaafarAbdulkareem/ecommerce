import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class ItemListCategeryBar extends StatelessWidget {
  const ItemListCategeryBar({
    super.key,
    required this.name,
    required this.onTap,
    required this.selected,
  });
  final String name;
  final VoidCallback onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: selected ? AppColor.primary : AppColor.backgroundIcon,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Text(
            name,
            style: selected
                ? AppStyle.styleSemiBold14(context)
                    .copyWith(color: AppColorText.textButton)
                : AppStyle.styleSemiBold14(context),
          ),
        ),
      ),
    );
  }
}
