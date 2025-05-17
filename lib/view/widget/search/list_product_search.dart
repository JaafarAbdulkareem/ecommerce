import 'package:ecommerce/controller/search/search_product_controller.dart';
import 'package:ecommerce/view/widget/search/item_list_product_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProductSearch extends GetView<SearchProductControllerImp> {
  const ListProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: check id builder 
    // return 
    // GetBuilder<SearchProductControllerImp>(
    //   id: ConstantKey.idListProductCart,
    //   builder: (controller) {
        return ListView(
          children: controller.searchData
              .asMap()
              .entries
              .map(
                (e) => AspectRatio(
                  aspectRatio: 4,
                  child: ItemListProductSearch(
                    index: e.key,
                    data: e.value,
                    onTap: () {
                      controller.goToProductDetail(e.key);
                    },
                  ),
                ),
              )
              .toList(),
        );
    //   },
    // );
  }
}
