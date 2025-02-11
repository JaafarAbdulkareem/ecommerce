import 'package:ecommerce/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class DotPageViewItem extends StatelessWidget {
  const DotPageViewItem({
    super.key,
    required this.select,
  });
  final bool select;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: select ? 12 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: select ? AppColor.primary : AppColor.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
