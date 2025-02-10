import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/view/screen/auth/choose_app_language.dart';
import 'package:ecommerce/view/screen/auth/onboarding_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> get getPages => [
      GetPage(
        name: ConstantScreenName.onboarding,
        page: () => OnboardingView(),
      ),
      GetPage(
        name: ConstantScreenName.language,
        page: () => ChooseAppLanguage(),
      ),
    ];
