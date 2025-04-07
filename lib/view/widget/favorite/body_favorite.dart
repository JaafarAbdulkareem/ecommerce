import 'package:ecommerce/controller/search/search_product_controller.dart';
import 'package:ecommerce/core/share/custom_search_widget.dart';
import 'package:ecommerce/view/screen/search/widget/body_search_view.dart';
import 'package:ecommerce/view/widget/favorite/list_display_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyFavorite extends StatelessWidget {
  const BodyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSearchWidget(
          isAppearFavorite: false,
        ),
        SizedBox(height: 16),
        GetBuilder<SearchProductControllerImp>(
          builder: (searchController) {
            return searchController.isSearch
                ? const BodySearchView()
                : const Expanded(
                    child: ListDisplayFavorite(),
                  );
          },
        ),
      ],
    );
  }
}
