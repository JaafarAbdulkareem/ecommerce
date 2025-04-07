import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/controller/search/search_product_controller.dart';
import 'package:ecommerce/core/constant/app_color.dart';
import 'package:ecommerce/core/constant/app_style.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/static/static_navigator_home_bar.dart';
import 'package:ecommerce/view/screen/search/search_view.dart';
import 'package:ecommerce/view/widget/home/home_floating_button.dart';
import 'package:ecommerce/view/widget/home/home_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    //update create bindings all home controller
    Get.lazyPut(() => SearchProductControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundScaffold,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${KeyLanguage.hello.tr} ${controller.authData.username}",
          style: AppStyle.styleBold16(context),
        ),
        backgroundColor: AppColor.primary,
      ),
      floatingActionButton: const HomeFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const HomeNavigatorBar(),
      body: SafeArea(
        child: GetBuilder<SearchProductControllerImp>(
          builder: (searchController) {
            return searchController.isSearch
                ? const SearchView()
                : GetBuilder<HomeControllerImp>(
                    builder: (controller) {
                      return dataNavigatorBar[controller.indexBar].screen;
                    },
                  );
          },
        ),
      ),
    );
  }
}
