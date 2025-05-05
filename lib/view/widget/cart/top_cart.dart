import 'package:ecommerce/controller/cart/coupons_controller.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:ecommerce/view/widget/cart/list_product_cart.dart';
import 'package:ecommerce/view/widget/cart/title_select_list_cart.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TopCart extends StatelessWidget {
  const TopCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          const Column(
            children: [
              SizedBox(height: 6),
              AspectRatio(
                aspectRatio: 9,
                child: TitleSelectListCart(),
              ),
              Expanded(
                child: ListProductCart(),
              ),
            ],
          ),
          GetBuilder<CouponsControllerImp>(builder: (controller) {
            return controller.isLottieEvffect
                ? Lottie.asset(AppLottie.couponsCelebration, repeat: false)
                : const SizedBox();
          }),
        ],
      ),
    );
  }
}
