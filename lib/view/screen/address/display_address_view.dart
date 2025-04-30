import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/address/body_display_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayAddressView extends StatelessWidget {
  const DisplayAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.titleDisplayAddress.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body:  SafeArea(
        child: const BodyDisplayAddressView(),
      ),
    );
  }
}
