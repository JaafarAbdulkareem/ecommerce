import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/function/load_cached_svg.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ItemCategoryListView extends StatelessWidget {
  const ItemCategoryListView({
    super.key,
    required this.data,
    required this.onTap,
  });
  final CategoryModel data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            color: AppColor.primary,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: FutureBuilder<Widget>(
                  future: loadCachedSvg(
                      "${ApiConstant.categoryImagePath}/${data.image}"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Lottie.asset(
                        AppLottie.loading,
                        height: 50,
                        width: 50,
                      );
                    } else if (snapshot.hasError) {
                      return const Icon(AppIcon.error);
                    } else {
                      return snapshot.data!;
                    }
                  },
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              translateLanguage(
                arabic: data.arabicName,
                english: data.englishName,
              ),
              style: AppStyle.styleBold12(context),
            ),
          ),
        ],
      ),
    );
  }
}
