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
import 'package:ecommerce/view/screen/checkout/checkout_view.dart';
import 'package:ecommerce/view/screen/favorite/favorite_view.dart';
import 'package:ecommerce/view/screen/home/home_view.dart';
import 'package:ecommerce/view/screen/notification/notification_view.dart';
import 'package:ecommerce/view/screen/onboarding/choose_app_language_view.dart';
import 'package:ecommerce/view/screen/onboarding/onboarding_view.dart';
import 'package:ecommerce/view/screen/order/invalid_order_view.dart';
import 'package:ecommerce/view/screen/order/detail_order_view.dart';
import 'package:ecommerce/view/screen/order/order_view.dart';
import 'package:ecommerce/view/screen/product/product_detail_view.dart';
import 'package:ecommerce/view/screen/product/product_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> get getPages => [
      GetPage(
        name: ConstantScreenName.language,
        page: () => const ChooseAppLanguageView(),
        middlewares: [
          OnboardingMiddleware(),
        ],
      ),
      GetPage(
        name: ConstantScreenName.onboarding,
        page: () => const OnboardingView(),
      ),
//*************************auth******************
      GetPage(
        name: ConstantScreenName.login,
        page: () => const LoginView(),
      ),
      GetPage(
        name: ConstantScreenName.signup,
        page: () => const SignupView(),
      ),
      GetPage(
        name: ConstantScreenName.forgetPassword,
        page: () => const ForgetPasswordView(),
      ),
      GetPage(
        name: ConstantScreenName.vertify,
        page: () => const VerificationView(),
      ),
      GetPage(
        name: ConstantScreenName.vertifySignup,
        page: () => const VerificationSignupView(),
      ),
      GetPage(
        name: ConstantScreenName.resetPassword,
        page: () => const ResetPasswordView(),
      ),
      GetPage(
        name: ConstantScreenName.success,
        page: () => const SuccessAuthView(),
      ),
//*********************************home********************
      GetPage(
        name: ConstantScreenName.home,
        page: () => const HomeView(),
      ),
      GetPage(
        name: ConstantScreenName.product,
        page: () => const ProductView(),
      ),
      GetPage(
        name: ConstantScreenName.productDetail,
        page: () => const ProductDetailView(),
      ),
      GetPage(
        name: ConstantScreenName.favorite,
        page: () => const FavoriteView(),
      ),
      GetPage(
        name: ConstantScreenName.cart,
        page: () => const CartView(),
      ),
      GetPage(
        name: ConstantScreenName.checkout,
        page: () => const CheckoutView(),
      ),
      GetPage(
        name: ConstantScreenName.order,
        page: () => const OrderView(),
      ),
      GetPage(
        name: ConstantScreenName.detailOrder,
        page: () => const DetailOrderView(),
      ),
      GetPage(
        name: ConstantScreenName.invalidOrder,
        page: () => const InvalidOrderView(),
      ),
      GetPage(
        name: ConstantScreenName.notification,
        page: () => const NotificationView(),
      ),
      GetPage(
        name: ConstantScreenName.insertAddress,
        page: () => const InsertAddressView(),
      ),
      GetPage(
        name: ConstantScreenName.detailInsertAddress,
        page: () => const DetailInsertAddressView(),
      ),
      GetPage(
        name: ConstantScreenName.displayAddress,
        page: () => const DisplayAddressView(),
      ),
    ];
