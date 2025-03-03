import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/view/widget/home/title_section_widget.dart';
import 'package:ecommerce/view/widget/product/list_color_product_detail.dart';
import 'package:flutter/material.dart';

class ColorProductDetail extends StatelessWidget {
  const ColorProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSectionWidget(title: KeyLanguage.color),
        ListColorProductDetail(),
      ],
    );
  }
}
