import 'package:ecommerce/data/data_source/static/static_onboarding.dart';
import 'package:ecommerce/view/widget/onboarding/slider_page_view_item.dart';
import 'package:flutter/material.dart';

class SliderPageView extends StatelessWidget {
  const SliderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
       
      },
      children: onboardingdata
          .map(
            (e) => SliderPageViewItem(
              data: e,
            ),
          )
          .toList(),
    );
  }
}
