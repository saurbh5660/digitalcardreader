import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:digital_card_grader/core/models/card_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../common/db_helper.dart';
import '../../../models/marketplace_response.dart';

class HomeController extends GetxController {
  final inputFocus = FocusNode();
  final inputController = TextEditingController();
  final isSearching = RxBool(false);
  var marketList = <MarketList>[].obs;

  @override
  void onInit() {
    super.onInit();
    final isLoggedIn = DbHelper().getIsLoggedIn();

    getMarketListing();
    Logger().d(isLoggedIn);
    inputFocus.addListener(() {
      if (inputFocus.hasFocus) {
        isSearching.value = true;
      }
    });
  }

  Future<void> getMarketListing() async {
    final Map<String,dynamic> body = {};
    var response = await ApiProvider().home(body);
    Logger().d(response);
    if (response.success == true) {
      marketList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }
}
