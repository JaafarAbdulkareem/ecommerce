import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/app_lottie.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    required this.statusRequest,
    required this.child,
  });
  final StatusRequest statusRequest;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Lottie.asset(
          AppLottie.loading,
        ),
      );
    } else {
      return child;
    }
  }
}
