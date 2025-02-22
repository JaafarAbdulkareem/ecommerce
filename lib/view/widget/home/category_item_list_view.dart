import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/data/models/category_logo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({
    super.key,
    required this.data,
  });
  final CategoryLogoModel data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: AppColor.primary,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SvgPicture.asset(
                data.image,
                colorFilter:
                    const ColorFilter.mode(AppColor.iconColor, BlendMode.srcIn),
                fit: BoxFit.fill,
                width: 50,
              ),
            ),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
           data.name,
            style: AppStyle.styleBold12(context),
          ),
        ),
      ],
    );
  }
}
