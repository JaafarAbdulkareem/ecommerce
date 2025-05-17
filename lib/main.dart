import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/core/binding/initial_bindings.dart';
import 'package:ecommerce/core/localization/locale_controller.dart';
import 'package:ecommerce/core/localization/translation_languages.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:ecommerce/navigator_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsService.initialService();
  // runApp(const MyApp());
  //remove
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      //remove
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: controller.theme,
      translations: TranslationLanguages(),
      locale: controller.language,
      initialBinding: InitialBindings(),
      // home: DetailOrderView(),
      // home: const ChooseAppLanguage(),
      // const LoginView(),
      getPages: getPages,
    );
  }
}
