import 'package:ecommerce/core/constant/api_column_db.dart';
import 'package:ecommerce/data/models/stripe_payment_model/ephemeral_key/associated_object_model.dart';

class EphemeralKeyModel {
  final String id;
  final String object;
  final List<AssociatedObjectModel> associatedObjects;
  final int created;
  final int expires;
  final bool livemode;
  final String secret;

  EphemeralKeyModel({
    required this.id,
    required this.object,
    required this.associatedObjects,
    required this.created,
    required this.expires,
    required this.livemode,
    required this.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json[ApiColumnDb.id] ?? '',
      object: json[ApiColumnDb.object] ?? '',
      associatedObjects: (json[ApiColumnDb.associatedObjects] as List<dynamic>?)
              ?.map((e) => AssociatedObjectModel.fromJson(e))
              .toList() ??
          [],
      created: json[ApiColumnDb.created] ?? 0,
      expires: json[ApiColumnDb.expires] ?? 0,
      livemode: json[ApiColumnDb.livemode] ?? false,
      secret: json[ApiColumnDb.secret] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiColumnDb.id: id,
      ApiColumnDb.object: object,
      ApiColumnDb.associatedObjects:
          associatedObjects.map((e) => e.toJson()).toList(),
      ApiColumnDb.created: created,
      ApiColumnDb.expires: expires,
      ApiColumnDb.livemode: livemode,
      ApiColumnDb.secret: secret,
    };
  }
}
