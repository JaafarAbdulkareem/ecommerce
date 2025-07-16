import 'package:ecommerce/controller/address/insert_address_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/address/body_insert_address_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertAddressView extends StatelessWidget {
  const InsertAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => InsertAddressControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(KeyLanguage.appBarTitleInsertAddress.tr),
      ),
      body: const SafeArea(
        child: BodyInsertAddressView(),
      ),
    );
  }
}
