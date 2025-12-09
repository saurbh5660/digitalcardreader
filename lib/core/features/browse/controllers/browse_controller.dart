import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../models/marketplace_response.dart';

class BrowseController extends GetxController {
  final inputController = TextEditingController();
  var marketList = <MarketList>[].obs;
  String search = "";
  Timer? _debounce;

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      search = query;
      getMarketListing();
    });
  }

  Future<void> getMarketListing() async {
    final Map<String,dynamic> body = {
      'search':search
    };
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
