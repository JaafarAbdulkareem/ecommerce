import 'dart:async';
import 'package:ecommerce/core/constant/constant_key.dart';
import 'package:ecommerce/core/service/shared_prefs_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfiniteCarouselController extends GetxController {
  final List<dynamic> items;
  final int initialPage = 10000; // Large value to allow looping
  late final PageController pageController;
  late final SharedPrefsService prefs;
  late final bool isRTL;
  final RxInt currentPage = 10000.obs;

  Timer? _timer;

  InfiniteCarouselController(this.items) {
    prefs = Get.find<SharedPrefsService>();
    pageController = PageController(initialPage: initialPage);
    isRTL = prefs.prefs.getString(ConstantKey.keyLanguage) == ConstantLanguage.ar;
  }

  void startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      if (!pageController.hasClients) return;

      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}

// import 'dart:async';
// import 'package:ecommerce/core/constant/constant_key.dart';
// import 'package:ecommerce/core/service/shared_prefs_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class InfiniteCarouselController extends GetxController {
//   late SharedPrefsService prefs;
//   late final PageController pageController;
//   final RxInt currentPage = 0.obs;
//   final List<dynamic> items;
//   final int initialPage = 0;
//   bool isRTL = false; // Initialize with a default value
//   Timer? _timer;

//   InfiniteCarouselController(this.items) {
//     prefs = Get.find<SharedPrefsService>();
//     pageController = PageController(initialPage: initialPage);
//     currentPage.value = initialPage;
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize isRTL after prefs is available
//     isRTL =
//         prefs.prefs.getString(ConstantKey.keyLanguage) == ConstantLanguage.ar
//             ? true
//             : false;
//   }

//   void startAutoSlide() {
//     // VERY IMPORTANT: Delay auto-slide until controller is attached
//     _timer = Timer.periodic(Duration(seconds: 3), (_) {
//       if (!pageController.hasClients) return;
//       currentPage.value = (currentPage.value + 1) % items.length;
//       pageController.animateToPage(
//         currentPage.value,
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     });
//   }

//   @override
//   void onClose() {
//     _timer?.cancel();
//     pageController.dispose();
//     super.onClose();
//   }
// }
