import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:get/get.dart';

String? validator(String? value, String type, int min, int max) {
  if (value == null) {
    return KeyLanguage.empty.tr;
  } else {
    value = value.trim();
    if (value.isEmpty) {
      return KeyLanguage.empty.tr;
    } else if (ConstantKey.usernameValidator == type) {
      if (!GetUtils.isUsername(value)) {
        return KeyLanguage.invalidUsername.tr;
      }
    } else if (ConstantKey.emailValidator == type) {
      if (!GetUtils.isEmail(value)) {
        return KeyLanguage.invalidEmail.tr;
      }
    } else if (ConstantKey.passwordValidator == type) {
      if (GetUtils.isNum(value)) {
        if (value.length < min) {
          return KeyLanguage.lessMin.tr + ConstantScale.minPassword.toString();
        }
        if (value.length > max) {
          return KeyLanguage.greaterMax.tr +
              ConstantScale.maxPassword.toString();
        }
      } else {
        return KeyLanguage.invalidPassword.tr;
      }
    } else if (ConstantKey.phoneValidator == type) {
      if (!GetUtils.isPhoneNumber(value)) {
        return KeyLanguage.invalidPhone.tr;
      }
    }
    return null;
  }
}
