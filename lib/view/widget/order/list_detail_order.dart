import 'package:ecommerce/controller/order/detail_order_controller.dart';
import 'package:ecommerce/view/widget/order/item_list_detail_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDetailOrder extends GetView<DetailOrderControllerImp> {
  const ListDetailOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.invalidProductData.length,
      itemBuilder: (context, index) => ItemListDetailOrder(
        data: controller.invalidProductData[index],
      ),
    );
  }
}
