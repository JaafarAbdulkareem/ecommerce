import 'package:ecommerce/core/share/custom_search_widget.dart';
import 'package:ecommerce/view/screen/search/widget/body_search_view.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        children: [
          CustomSearchWidget(
            autofocus: true,
          ),
          SizedBox(height: 10),
          BodySearchView(),
        ],
      ),
    );
  }
}
