import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/data_source/static/static%20_category_logo.dart';
import 'package:ecommerce/view/widget/home/category_item_list_view.dart';
import 'package:ecommerce/view/widget/home/title_section_widget.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleSectionWidget(title: KeyLanguage.titleCategories),
        SizedBox(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dataCategoryLogo.length,
            itemBuilder: (context, index) => CategoryItemListView(
              data: dataCategoryLogo[index],
            ),
          ),
        ),
      ],
    );
  }
}
