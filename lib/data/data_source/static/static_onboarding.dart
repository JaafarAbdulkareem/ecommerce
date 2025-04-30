import 'package:ecommerce/core/constant/app_images.dart';
import 'package:ecommerce/core/localization/key_language.dart';
import 'package:ecommerce/data/models/onboarding_model.dart';

const List<OnboardingModel> dataOnboarding = [
  OnboardingModel(
    title: KeyLanguage.chooseProduct,
    image: AppImages.imagesOnboardingone,
    body: KeyLanguage.bodyChooseProduct,
  ),
  OnboardingModel(
    title: KeyLanguage.easyAndSafePayment,
    image: AppImages.imagesOnboardingtwo,
    body: KeyLanguage.bodyChooseProduct,
  ),
  OnboardingModel(
    title: KeyLanguage.trackYourOrder,
    image: AppImages.imagesOnboardingthree,
    body: KeyLanguage.bodyChooseProduct,
  ),
  OnboardingModel(
    title: KeyLanguage.fastDelivery,
    image: AppImages.imagesOnboardingfour,
    body: KeyLanguage.bodyChooseProduct,
  ),
];
