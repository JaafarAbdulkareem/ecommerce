import 'package:ecommerce/controller/order/invalid_order_controller.dart';
import 'package:ecommerce/view/widget/order/item_list_invalid_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListInvalidOrder extends GetView<InvalidOrderControllerImp> {
  const ListInvalidOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.invalidOrderData.length,
      itemBuilder: (context, index) => ItemListInvalidOrder(
        data: controller.invalidOrderData[index],
      ),
    );
  }
}
