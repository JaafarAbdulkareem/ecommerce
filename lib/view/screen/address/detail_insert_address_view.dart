import 'package:ecommerce/controller/address/detail_address_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/address/body_detail_insert_address_view.dart';
import 'package:ecommerce/view/widget/address/bottom_button_next_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailInsertAddressView extends StatelessWidget {
  const DetailInsertAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DetailAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KeyLanguage.appBarTitleDetailInsertAddress.tr,
        ),
      ),
      bottomSheet: const BottomButtonNextAddress(),
      body: const SafeArea(
        child: BodyDetailInsertAddressView(),
      ),
    );
  }
}
