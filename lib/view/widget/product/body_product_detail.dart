import 'package:ecommerce/view/widget/product/image_product_detail.dart';
import 'package:ecommerce/view/widget/product/info_product_detail.dart';
import 'package:flutter/material.dart';

class BodyProductDetail extends StatelessWidget {
  const BodyProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 14),
          ImageProductDetail(),
          SizedBox(height: 20),
          InfoProductDetail(),
        ],
      ),
    );
  }
}
