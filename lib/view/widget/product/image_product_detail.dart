import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/product/product_detail_controller.dart';
import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ImageProductDetail extends GetView<ProductDetailControllerImp> {
  const ImageProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const AspectRatio(
          aspectRatio: 2.2,
          child: ColoredBox(
            color: AppColor.primary,
          ),
        ),
        Positioned(
          top: -25,
          right: 30,
          left: 30,
          // child: Hero(
          //   tag: ConstantKey.tagProductImage +
          //       controller.productDetailData.id.toString(),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              height: 230,
              imageUrl:
                  "${ApiConstant.productImagePath}/${controller.productDetailData.image}",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Lottie.asset(
                AppLottie.loading,
              ),
              errorWidget: (context, url, error) => const Icon(AppIcon.error),
            ),
          ),
          // ),
        ),
      ],
    );
  }
}
