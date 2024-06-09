import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update current index when page scroll
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  /// Jump to the specific dot selected page
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current index & jump to next page
  void nextPage() {
    int nextPageIndex = currentPageIndex.value + 1;
    if (nextPageIndex > 2) {
      // Uncomment this if you have a LoginScreen
      Get.to(LoginScreen());
      print("Navigate to LoginScreen");
    } else {
      currentPageIndex.value = nextPageIndex;
      pageController.jumpToPage(nextPageIndex);
    }
  }

  /// Update current index & jump to the last page
  void skipPage() {
    Get.to(LoginScreen());
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
