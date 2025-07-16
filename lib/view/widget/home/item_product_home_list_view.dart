import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ItemProductHomeListView extends StatelessWidget {
  const ItemProductHomeListView({
    super.key,
    required this.data,
  });
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: "${ApiConstant.productImagePath}/${data.image}",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Lottie.asset(
              AppLottie.loading,
            ),
            errorWidget: (context, url, error) => const Icon(AppIcon.error),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                translateLanguage(
                  arabic: data.arabicName,
                  english: data.englishName,
                ),
                style: theme.textTheme.headlineMedium,
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
