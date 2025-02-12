import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/view/screen/auth/forget_password/forget_password_view.dart';
import 'package:ecommerce/view/screen/auth/forget_password/reset_password_view.dart';
import 'package:ecommerce/view/screen/auth/forget_password/verification_view.dart';
import 'package:ecommerce/view/screen/auth/login_view.dart';
import 'package:ecommerce/view/screen/auth/signup/signup_view.dart';
import 'package:ecommerce/view/screen/auth/signup/success_auth_view.dart';
import 'package:ecommerce/view/screen/auth/signup/verification_signup_view.dart';
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
      GetPage(
        name: ConstantScreenName.forgetPassword,
        page: () => ForgetPasswordView(),
      ),
      GetPage(
        name: ConstantScreenName.vertify,
        page: () => VerificationView(),
      ),
      GetPage(
        name: ConstantScreenName.vertifySignup,
        page: () => VerificationSignupView(),
      ),
      GetPage(
        name: ConstantScreenName.resetPassword,
        page: () => ResetPasswordView(),
      ),
      GetPage(
        name: ConstantScreenName.success,
        page: () => SuccessAuthView(),
      ),
    ];
