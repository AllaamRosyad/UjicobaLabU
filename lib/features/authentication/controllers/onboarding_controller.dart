// class OnBoardingController extends GetxController {
//   static OnBoardingController get instance => Get.find();

//   /// Variables
//   final pageController = PageController();
//   Rx<int> currentPageIndex = 0.obs;

//   /// Update current index when page scroll
//   void updatePageIndicator(index) {
//     currentPageIndex.value = index;
//   }

//   /// Jump to the specific dot selected page
//   void dotNavigationClick(index) {
//     currentPageIndex.value = index;
//     pageController.jumpTo(index);
//   }

//   /// Update current index & jump to next page
//   void nextPage() {
//     if (currentPageIndex.value == 2) {
//       final storage = GetStorage();

//       if (kDebugMode) {
//         print('=== GET STORAGE ===');
//         print(storage.read('IsFirstTime'));
//       }
//       storage.write('IsFirstTime', false);
//       Get.offAll(LoginScreen());
//     } else {
//       int page = currentPageIndex.value + 1;
//       pageController.jumpToPage(page);
//     }

//     /// Update current index & jump to the last page
//     void skipPage() {
//       Get.to(LoginScreen());
//       currentPageIndex.value = 2;
//       pageController.jumpToPage(2);
//     }
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update current index when page scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  // Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index); // Perbaikan di sini
  }

  // Update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if (kDebugMode) {
        print('=== GET STORAGE ===');
        print(storage.read('IsFirstTime'));
      }
      storage.write('IsFirstTime', false);
      Get.offAll(() => const LoginScreen()); // Tambahkan () => untuk LoginScreen
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update current index & jump to the last page
  void skipPage() {
    Get.offAll(() => const LoginScreen()); // Tambahkan () => untuk LoginScreen
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
