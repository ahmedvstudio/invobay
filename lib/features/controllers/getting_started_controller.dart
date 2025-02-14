import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invobay/screens/main_screen.dart';

class GettingStartedController extends GetxController {
  static GettingStartedController get instance => Get.find();

  //variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update current index when page scroll
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  // Jump to a specific dot page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.to(const MainScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //
  void skipPage() {
    Get.to(const MainScreen());
  }
}
