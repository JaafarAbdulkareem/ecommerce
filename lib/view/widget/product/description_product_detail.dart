import 'package:ecommerce/view/widget/product/image_product_detail.dart';
import 'package:ecommerce/view/widget/product/info_product_detail.dart';
import 'package:flutter/material.dart';

class DescriptionProductDetail extends StatelessWidget {
  const DescriptionProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 14),
        ImageProductDetail(),
        SizedBox(height: 20),
        InfoProductDetail(),
        SizedBox(height: 20),
      ],
    );
  }
}
