import 'package:ecommerce/view/widget/onboarding/slider_page_view.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Column(
          children: [
            Expanded(child: SliderPageView(),),
            SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}

