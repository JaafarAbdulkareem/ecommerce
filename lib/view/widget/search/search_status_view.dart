import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SearchStatusView extends StatelessWidget {
  const SearchStatusView({
    super.key,
    required this.statusRequest,
    required this.child,
  });
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.initial) {
      return Expanded(
        child: Center(
          child: Text(
            KeyLanguage.enterEnter.tr,
            style: AppStyle.styleBold14(context),
          ),
        ),
      );
    } else if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(
          AppLottie.loading,
          height: 250,
          width: 250,
        ),
      );
    } else if (statusRequest == StatusRequest.failure) {
      return Center(
        child: Lottie.asset(
          AppLottie.nodata,
          repeat: false,
        ),
      );
    } else if (statusRequest == StatusRequest.serverFailur) {
      return Center(
        child: Lottie.asset(AppLottie.server),
      );
    } else if (statusRequest == StatusRequest.offlineFailur) {
      return Center(
        child: Lottie.asset(
          AppLottie.offline,
          repeat: false,
        ),
      );
    } else {
      return child;
    }
  }
}
