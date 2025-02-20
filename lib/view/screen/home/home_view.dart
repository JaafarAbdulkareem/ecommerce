import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/home/custom_ads_widget.dart';
import 'package:ecommerce/view/widget/home/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${KeyLanguage.hello.tr} username",
          style: AppStyle.styleBold16(context),
        ),
        backgroundColor: AppColor.primary,
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          children: [
            CustomSearchWidget(),
            SizedBox(
              height: 8
            ),
            CustomAdsWidget(),
          ],
        ),
      )),
    );
  }
}
