import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/api_key.dart';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/function/handle_status.dart';
import 'package:ecommerce/data/data_source/remote/home/search_remote.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchProductController extends GetxController {
  void onSearch();
  void onChange(value);
  void goToProductDetail(int newIndex);
}

class SearchProductControllerImp extends SearchProductController {
  late SearchRemote searchRemote;
  late List<ProductModel> searchData;
  late TextEditingController textController;
  late bool isSearch;
  late StatusRequest statusRequest;

  @override
  void onInit() {
    searchRemote = SearchRemote(curd: Get.find());
    searchData = [];
    textController = TextEditingController();
    isSearch = false;
    statusRequest = StatusRequest.initial;
    super.onInit();
  }

  Future<void> fetchData(response) async {
    for (var element in response) {
      searchData.add(ProductModel.fromJson(element));
    }
  }

  Future<void> getData(String searchName) async {
    searchData.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchRemote.getData(searchName: searchName);
    statusRequest = handleStatus(response);
    if (statusRequest == StatusRequest.success) {
      if (response[ApiResult.status] == ApiResult.success) {
        await fetchData(response[ApiResult.data]);
        statusRequest = StatusRequest.success;
        update();
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      update();
    }
  }

  @override
  void onSearch() async {
    await getData(textController.text);
  }

  @override
  void onChange(value) {
    statusRequest = StatusRequest.initial;
    if (value == "" || value == null) {
      isSearch = false;
      searchData.clear();
      update();
    } else {
      isSearch = true;
      update();
    }
  }

  @override
  void goToProductDetail(int newIndex) async {
    await Get.toNamed(
      ConstantScreenName.productDetail,
      arguments: {
        ConstantKey.productData: searchData[newIndex],
        //update 1
        ConstantKey.count: searchData[newIndex].count,
      },
    );
  }
}
