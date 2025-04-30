import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/address/body_detail_insert_address_view.dart';
import 'package:ecommerce/view/widget/address/bottom_button_next_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailInsertAddressView extends StatelessWidget {
  const DetailInsertAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          KeyLanguage.titleDetailInsertAddress.tr,
          style: AppStyle.styleBold18(context),
        ),
      ),
      bottomSheet: const BottomButtonNextAddress(),
      body: const SafeArea(
        child: BodyDetailInsertAddressView(),
      ),
    );
  }
}
