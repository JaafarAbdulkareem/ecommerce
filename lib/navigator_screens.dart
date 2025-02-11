import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/view/screen/auth/login_view.dart';
import 'package:ecommerce/view/screen/auth/signup_view.dart';
import 'package:ecommerce/view/screen/onboarding/choose_app_language.dart';
import 'package:ecommerce/view/screen/onboarding/onboarding_view.dart';
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
      GetPage(
        name: ConstantScreenName.login,
        page: () => LoginView(),
      ),
      GetPage(
        name: ConstantScreenName.signup,
        page: () => SignupView(),
      ),
    ];
