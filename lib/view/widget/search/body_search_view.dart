import 'package:ecommerce/controller/search/search_product_controller.dart';
import 'package:ecommerce/core/share/status_view.dart';
import 'package:ecommerce/view/widget/search/list_product_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodySearchView extends StatelessWidget {
  const BodySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchProductControllerImp>(
      builder: (controller) {
        return StatusView(
          statusRequest: controller.statusRequest,
          child: const Expanded(
            child: ListProductSearch(),
          ),
        );
      },
    );
  }
}
