import 'package:ecommerce/core/constant/constant_screen_name.dart';
import 'package:ecommerce/core/middleware/onboarding_middleware.dart';
import 'package:ecommerce/view/screen/address/detail_insert_address_view.dart';
import 'package:ecommerce/view/screen/address/display_address_view.dart';
import 'package:ecommerce/view/screen/address/insert_address_view.dart';
import 'package:ecommerce/view/screen/auth/forget_password/forget_password_view.dart';
import 'package:ecommerce/view/screen/auth/forget_password/reset_password_view.dart';
import 'package:ecommerce/view/screen/auth/forget_password/verification_view.dart';
import 'package:ecommerce/view/screen/auth/login_view.dart';
import 'package:ecommerce/view/screen/auth/signup/signup_view.dart';
import 'package:ecommerce/view/screen/auth/signup/success_auth_view.dart';
import 'package:ecommerce/view/screen/auth/signup/verification_signup_view.dart';
import 'package:ecommerce/view/screen/cart/cart_view.dart';
import 'package:ecommerce/view/screen/favorite/favorite_view.dart';
import 'package:ecommerce/view/screen/home/home_view.dart';
import 'package:ecommerce/view/screen/onboarding/choose_app_language_view.dart';
import 'package:ecommerce/view/screen/onboarding/onboarding_view.dart';
import 'package:ecommerce/view/screen/product/product_detail_view.dart';
import 'package:ecommerce/view/screen/product/product_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> get getPages => [
      GetPage(
        name: ConstantScreenName.language,
        page: () => ChooseAppLanguageView(),
        middlewares: [
          OnboardingMiddleware(),
        ],
      ),
      GetPage(
        name: ConstantScreenName.onboarding,
        page: () => OnboardingView(),
      ),
//*************************auth******************
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
//*********************************home********************
      GetPage(
        name: ConstantScreenName.home,
        page: () => HomeView(),
      ),
      GetPage(
        name: ConstantScreenName.product,
        page: () => ProductView(),
      ),
      GetPage(
        name: ConstantScreenName.productDetail,
        page: () => ProductDetailView(),
      ),
      GetPage(
        name: ConstantScreenName.favorite,
        page: () => FavoriteView(),
      ),
      GetPage(
        name: ConstantScreenName.cart,
        page: () => CartView(),
      ),
      GetPage(
        name: ConstantScreenName.insertAddress,
        page: () => InsertAddressView(),
      ),
      GetPage(
        name: ConstantScreenName.detailInsertAddress,
        page: () => DetailInsertAddressView(),
      ),
      GetPage(
        name: ConstantScreenName.displayAddress,
        page: () => DisplayAddressView(),
      ),
    ];
