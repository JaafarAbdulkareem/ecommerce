import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageCart extends StatelessWidget {
  const ImageCart({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: "${ApiConstant.productImagePath}/$image",
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Lottie.asset(
          AppLottie.loading,
        ),
        errorWidget: (context, url, error) => const Icon(
          AppIcon.error,
        ),
      ),
    );
  }
}
