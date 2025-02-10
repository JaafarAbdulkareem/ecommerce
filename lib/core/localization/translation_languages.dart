import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:get/get.dart';

class TranslationLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ConstantLanguage.ar: {
          KeyLanguage.chooseLanguage: "اختر اللغة",
          KeyLanguage.arabic: "العربية",
          KeyLanguage.english: "انجليزي",
        },
        ConstantLanguage.en: {
          KeyLanguage.chooseLanguage: "choose language",
          KeyLanguage.arabic: "Arabic",
          KeyLanguage.english: "English",
        }
      };
}
