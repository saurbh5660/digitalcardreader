import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../models/card_list_response.dart';

class InventoryController extends GetxController {
  var cardList = <CardList>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCardListing();
  }

  Future<void> getCardListing() async {
    Map<String, dynamic> data = {};
    // data["userId"] = userId;
    var response = await ApiProvider().getCardListWithId(data);
    Logger().d(response);
    if (response.success == true) {
      cardList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }
}
