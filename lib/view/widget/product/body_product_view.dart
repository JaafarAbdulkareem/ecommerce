import 'package:ecommerce/controller/product/product_controller.dart';
import 'package:ecommerce/view/widget/home/home_status_view.dart';
import 'package:ecommerce/view/widget/product/list_category_bar.dart';
import 'package:ecommerce/view/widget/product/list_display_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BodyProductView extends StatelessWidget {
  const BodyProductView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListCategoryBar(),
        GetBuilder<ProductControllerImp>(
          builder: (controller) {
            return HomeStatusView(
              statusRequest: controller.statusRequest,
              child: const Expanded(
                child: ListDisplayProduct(),
              ),
            );
          },
        ),
      ],
    );
  }
}
