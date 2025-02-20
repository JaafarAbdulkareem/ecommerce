import 'package:ecommerce/view/widget/home/custom_search_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomSearchWidget(),
          ],
        ),
      )),
    ) ;
  }
}