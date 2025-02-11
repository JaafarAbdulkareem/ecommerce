import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/languages/arabic.dart';
import 'package:ecommerce/core/localization/languages/english.dart';
import 'package:get/get.dart';

class TranslationLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      ConstantLanguage.ar: arabic,
      ConstantLanguage.en: english,
    };
  }
}
