import 'package:ecommerce/controller/search/search_product_controller.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/view/widget/search/item_list_product_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProductSearch extends GetView<SearchProductControllerImp> {
  const ListProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> data = controller.searchData;
    return ListView(
      children: data
          .asMap()
          .entries
          .map(
            (e) => AspectRatio(
              aspectRatio: 4,
              child: e.value.active == 1 || e.value.countProduct != 0
                  ? ItemListProductSearch(
                      index: e.key,
                      data: e.value,
                      onTap: () {
                        controller.goToProductDetail(e.key);
                      },
                    )
                  : const SizedBox(),
            ),
          )
          .toList(),
    );
  }
}
