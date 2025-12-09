import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';

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

  Future<void> packBuy(int type) async {
    Map<String, dynamic> data = {
      "packType": type,
    };
    var response = await ApiProvider().packBuy(data);
    if (response.success == true) {
      Get.back(result: true);
      Utils.showToast(message: 'Pack bought successfully!');

    } else {
      Utils.showErrorToast(message: response.message);
    }
  }
}