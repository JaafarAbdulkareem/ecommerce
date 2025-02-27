import 'package:ecommerce/controller/home/body_home_controller.dart';
import 'package:ecommerce/view/widget/home/category_list_view.dart';
import 'package:ecommerce/view/widget/home/home_status_view.dart';
import 'package:ecommerce/view/widget/home/product_home_list_view.dart';
import 'package:ecommerce/view/widget/home/top_home_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyHomeView extends StatelessWidget {
  const BodyHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => BodyHomeControllerImp());
    return GetBuilder<BodyHomeControllerImp>(
      builder: (controller) {
        return HomeStatusView(
          statusRequest: controller.statusRequest,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TopHomeSection(),
                ),
                SliverToBoxAdapter(
                  child: CategoryListView(),
                ),
                SliverToBoxAdapter(
                  child: ProductHomeListView(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
