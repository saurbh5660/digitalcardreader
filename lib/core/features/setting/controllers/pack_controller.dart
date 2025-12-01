import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PacksController extends GetxController {
  final PageController pageController = PageController(viewportFraction: 0.85);
  var currentPage = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(_pageListener);
  }

  void _pageListener() {
    currentPage.value = pageController.page ?? 0.0;
  }

  @override
  void onClose() {
    pageController.removeListener(_pageListener);
    pageController.dispose();
    super.onClose();
  }
}