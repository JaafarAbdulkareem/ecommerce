import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/rating/rating_controller.dart';
import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:lottie/lottie.dart';

Future<void> showRatingDialogProduct({
  required BuildContext context,
  required int index,
  required String image,
  required String productId,
  required String orderId,
}) async {
  final RatingControllerImp controller = Get.put(RatingControllerImp());

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return AlertDialog(
        title: Text(
          KeyLanguage.ratingTitle.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const FlutterLogo(size: 80),
            CachedNetworkImage(
              height: 80,
              imageUrl: "${ApiConstant.productImagePath}/$image",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Lottie.asset(
                AppLottie.loading,
              ),
              errorWidget: (context, url, error) => const Icon(
                AppIcon.error,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              KeyLanguage.ratingHint.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < controller.rating.value
                              ? Icons.star
                              : Icons.star_border,
                          color: AppColor.star,
                          size: ConstantScale.iconRating,
                        ),
                        onPressed: () {
                          controller.setRating(index + 1.0);
                        },
                      );
                    }),
                  )),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller.commentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: KeyLanguage.commentHint.tr,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // cancel
            },
            child: Text(KeyLanguage.cancelButton.tr),
          ),
          ElevatedButton(
            onPressed: () {
              controller.submitRating(
                index: index,
                productId: productId,
                orderId: orderId,
              );
            },
            child: Text(KeyLanguage.submitButton.tr),
          ),
        ],
      );
    },
  );
}
