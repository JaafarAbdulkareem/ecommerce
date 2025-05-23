import 'package:ecommerce/controller/order/archive_order_controller.dart';
import 'package:ecommerce/view/widget/order/item_list_order.dart';
import 'package:flutter/material.dart';

class BodyArchiveOrderView extends StatelessWidget {
  const BodyArchiveOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ArchiveOrderControllerImp.archiveOrderData.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: ItemListOrder(
          data: ArchiveOrderControllerImp.archiveOrderData[index],
        ),
      ),
    );
  }
}
