import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/api_constant.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_icon.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/function/translate_language.dart';
import 'package:ecommerce/core/share/custom_discount_widget.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/view/widget/product/foot_item_product.dart';
import 'package:ecommerce/view/widget/product/price_product_item.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ItemListDisplayProduct extends StatelessWidget {
  const ItemListDisplayProduct({
    super.key,
    required this.index,
    required this.data,
    required this.onTap,
  });
  final int index;
  final ProductModel data;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColor.card,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Hero(
                  //   tag: ConstantKey.tagProductImage + data.id.toString(),
                  //   child:
                  CachedNetworkImage(
                    height: 60,
                    fit: BoxFit.fill,
                    imageUrl: "${ApiConstant.productImagePath}/${data.image}",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Lottie.asset(
                      AppLottie.loading,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(AppIcon.error),
                  ),
                  // ),
                  Text(
                    translateLanguage(
                      arabic: data.arabicName,
                      english: data.englishName,
                    ),
                    style: AppStyle.styleSemiBold14(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    translateLanguage(
                      arabic: data.arabicDescription,
                      english: data.englishDescription,
                    ),
                    style: AppStyle.styleBold10(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  PriceProductItem(
                    price: data.price,
                    discount: data.discount,
                    discountPrice: data.discountPrice,
                  ),
                  FootItemProduct(
                    index: index,
                    rating: data.rating.toString(),
                  )
                ],
              ),
            ),
            data.discount == 0 || data.discount == 0.0
                ? const SizedBox()
                : CustomDiscountWidget(discount: data.discount),
          ],
        ),
      ),
    );
  }
}
