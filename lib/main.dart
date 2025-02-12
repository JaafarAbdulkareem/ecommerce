import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/localization/locale_controller.dart';
import 'package:ecommerce/core/localization/translation_languages.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/navigator_screens.dart';
import 'package:ecommerce/view/screen/auth/login_view.dart';
import 'package:ecommerce/view/screen/onboarding/choose_app_language.dart';
import 'package:ecommerce/view/screen/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsService.initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: controller.theme,
      translations: TranslationLanguages(),
      locale: controller.language,
      home: 
      // const ChooseAppLanguage(),
      const LoginView(),
      getPages: getPages,
    );
  }
}
