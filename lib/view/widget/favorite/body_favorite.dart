import 'package:ecommerce/core/share/custom_search_widget.dart';
import 'package:ecommerce/view/widget/favorite/list_display_favorite.dart';
import 'package:flutter/material.dart';

class BodyFavorite extends StatelessWidget {
  const BodyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSearchWidget(
          isAppearFavorite: false,
        ),
        SizedBox(height: 16),
        Expanded(
          child: ListDisplayFavorite(),
        ),
      ],
    );
  }
}
