import 'package:ecommerce/controller/home/home_controller.dart';
import 'package:ecommerce/controller/search/search_product_controller.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/static/static_navigator_home_bar.dart';
import 'package:ecommerce/view/screen/search/search_view.dart';
import 'package:ecommerce/view/widget/home/floating_action_cart_button.dart';
import 'package:ecommerce/view/widget/home/home_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final HomeControllerImp controller = Get.put(HomeControllerImp());

    // Ensure the search controller is available when needed
    Get.lazyPut(() => SearchProductControllerImp(), fenix: true);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "${KeyLanguage.hello.tr} ${controller.username}",
        ),
      ),
      floatingActionButton: const FloatingActionCartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const HomeNavigatorBar(),
      body: SafeArea(
        child: GetBuilder<SearchProductControllerImp>(
          builder: (searchController) {
            return searchController.isSearch
                ? const SearchView()
                : GetBuilder<HomeControllerImp>(
                    builder: (controller) =>
                        dataNavigatorBar[controller.indexBar].screen,
                  );
          },
        ),
      ),
    );
  }
}
