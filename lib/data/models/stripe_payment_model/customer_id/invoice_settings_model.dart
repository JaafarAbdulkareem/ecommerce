import 'package:ecommerce/core/constant/api_column_db.dart';

class InvoiceSettingsModel {
  final dynamic customFields;
  final String? defaultPaymentMethod;
  final String? footer;
  final dynamic renderingOptions;

  InvoiceSettingsModel({
    this.customFields,
    this.defaultPaymentMethod,
    this.footer,
    this.renderingOptions,
  });

  factory InvoiceSettingsModel.fromJson(Map<String, dynamic> json) {
    return InvoiceSettingsModel(
      customFields: json[ApiColumnDb.customFields],
      defaultPaymentMethod: json[ApiColumnDb.defaultPaymentMethod],
      footer: json[ApiColumnDb.footer],
      renderingOptions: json[ApiColumnDb.renderingOptions],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.customFields: customFields,
      ApiColumnDb.defaultPaymentMethod: defaultPaymentMethod,
      ApiColumnDb.footer: footer,
      ApiColumnDb.renderingOptions: renderingOptions,
    };
  }
}
