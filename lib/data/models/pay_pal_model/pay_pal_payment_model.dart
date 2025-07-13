import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/models/pay_pal_model/amount_model.dart';
import 'package:ecommerce/data/models/pay_pal_model/item_list_model.dart';
import 'package:get/get.dart';

class PayPalPaymentModel {
  final AmountModel amount;
  final String description;
  final ItemListModel itemList;

  PayPalPaymentModel({
    required this.amount,
    this.description = KeyLanguage.paymentTransactionDescription,
    required this.itemList,
  });

  factory PayPalPaymentModel.fromJson(Map<String, dynamic> json) {
    return PayPalPaymentModel(
      amount: AmountModel.fromJson(json[ApiColumnDb.amount]),
      description: json[ApiColumnDb.description] ?? '',
      itemList: ItemListModel.fromJson(json[ApiColumnDb.itemList]),
    );
  }

  // factory PayPalPaymentModel.formCart(){
  //   return PayPalPaymentModel(amount: amount, itemList: itemList)
  // }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.amount: amount.toJson(),
      ApiColumnDb.description: description.tr,
      ApiColumnDb.itemList: itemList.toJson(),
    };
  }
}
