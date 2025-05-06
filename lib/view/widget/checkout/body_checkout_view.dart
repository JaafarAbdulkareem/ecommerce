import 'package:ecommerce/view/widget/checkout/delivery_method.dart';
import 'package:ecommerce/view/widget/checkout/payment_method.dart';
import 'package:flutter/material.dart';

class BodyCheckoutView extends StatelessWidget {
  const BodyCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),
            PaymentMethod(),
            SizedBox(height: 6),
            DeliveryMethod(),
          ],
        ),
      ),
    );
  }
}
