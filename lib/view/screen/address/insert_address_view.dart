import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/address/body_insert_address_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertAddressView extends StatelessWidget {
  const InsertAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.titleInsertAddress.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      body: const SafeArea(
        child: BodyInsertAddressView(),
      ),
    );
  }
}
