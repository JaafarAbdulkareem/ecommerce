import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/core/constant/api_key_secret.dart';
import 'package:ecommerce/data/models/stripe_payment_model/customer_id/invoice_settings_model.dart';

class CustomerIdModel {
  final String id;
  final String object;
  final int balance;
  final int created;
  final String? currency;
  final String? defaultSource;
  final bool delinquent;
  final String? description;
  final String? email;
  final String invoicePrefix;
  final InvoiceSettingsModel? invoiceSettings;
  final bool livemode;
  final String? name;
  final int nextInvoiceSequence;
  final String? phone;
  final List<dynamic> preferredLocales;
  final String taxExempt;

  CustomerIdModel({
    required this.id,
    required this.object,
    required this.balance,
    required this.created,
    this.currency,
    this.defaultSource,
    required this.delinquent,
    this.description,
    this.email,
    required this.invoicePrefix,
    this.invoiceSettings,
    required this.livemode,
    this.name,
    required this.nextInvoiceSequence,
    this.phone,
    required this.preferredLocales,
    required this.taxExempt,
  });

  factory CustomerIdModel.fromJson(Map<String, dynamic> json) {
    return CustomerIdModel(
      id: json[ApiColumnDb.id] ?? '',
      object: json[ApiColumnDb.object] ?? '',
      balance: json[ApiColumnDb.balance] ?? 0,
      created: json[ApiColumnDb.created] ?? 0,
      currency: json[ApiColumnDb.currency],
      defaultSource: json[ApiColumnDb.defaultSource],
      delinquent: json[ApiColumnDb.delinquent] ?? false,
      description: json[ApiColumnDb.description],
      email: json[ApiColumnDb.email],
      invoicePrefix: json[ApiColumnDb.invoicePrefix] ?? '',
      invoiceSettings: json[ApiColumnDb.invoiceSettings] != null
          ? InvoiceSettingsModel.fromJson(json[ApiColumnDb.invoiceSettings])
          : null,
      livemode: json[ApiColumnDb.livemode] ?? false,
      name: json[ApiColumnDb.name],
      nextInvoiceSequence: json[ApiColumnDb.nextInvoiceSequence] ?? 0,
      phone: json[ApiColumnDb.phone],
      preferredLocales: json[ApiColumnDb.preferredLocales] ?? [],
      taxExempt: json[ApiColumnDb.taxExempt] ?? 'none',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.email: email,
      ApiColumnDb.name: name,
      ApiColumnDb.phone: phone,
      ApiColumnDb.secretKey: ApiKeySecret.keySecret,
    };
  }
}
