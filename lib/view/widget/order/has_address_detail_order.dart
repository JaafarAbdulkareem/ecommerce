import 'package:ecommerce/view/widget/order/google_map_detail_order.dart';
import 'package:ecommerce/view/widget/order/shipping_address_detail_order.dart';
import 'package:flutter/material.dart';

class HasAddressDetailOrder extends StatelessWidget {
  const HasAddressDetailOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 16),
        ShippingAddressDetailOrder(),
        SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 1,
          child: GoogleMapDetailOrder(),
        ),
      ],
    );
  }
}
