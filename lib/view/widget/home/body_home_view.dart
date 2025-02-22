import 'package:ecommerce/view/widget/home/category_list_view.dart';
import 'package:ecommerce/view/widget/home/top_home_section.dart';
import 'package:flutter/material.dart';

class BodyHomeView extends StatelessWidget {
  const BodyHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TopHomeSection(),
          ),
          SliverToBoxAdapter(
            child: CategoryListView(),
          ),
        ],
      ),
    );
  }
}
