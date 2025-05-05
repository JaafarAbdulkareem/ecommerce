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
          children: [
            SizedBox(height: 6),
            PaymentMethod(),
          ],
        ),
      ),
    );
  }
}
