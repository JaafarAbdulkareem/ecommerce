import 'package:ecommerce/controller/favorite/favorite_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/view/widget/favorite/body_favorite.dart';
import 'package:ecommerce/view/widget/home/home_status_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavoriteControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundScaffold,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: GetBuilder<FavoriteControllerImp>(
            builder: (controller) {
              return HomeStatusView(
                statusRequest: controller.statusRequest,
                child: BodyFavorite(),
              );
            },
          ),
        ),
      ),
    );
  }
}
