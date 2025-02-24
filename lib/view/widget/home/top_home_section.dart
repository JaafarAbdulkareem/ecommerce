import 'package:ecommerce/view/widget/home/custom_ads_widget.dart';
import 'package:ecommerce/view/widget/home/custom_search_widget.dart';
import 'package:flutter/material.dart';

class TopHomeSection extends StatelessWidget {
  const TopHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAdsWidget(),
        SizedBox(height: 8),
        CustomSearchWidget(),
      ],
    );
  }
}
