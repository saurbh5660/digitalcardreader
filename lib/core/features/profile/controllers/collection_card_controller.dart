import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../models/card_list_response.dart';

class CollectionCardController extends GetxController {
  var collectionId = "";
  var userId = "";
  var cardList = <CardList>[].obs;

  @override
  void onInit() {
    super.onInit();
    collectionId = Get.arguments?["id"] ?? '';
    userId = Get.arguments?["userId"] ?? '';
    getCardListing();
  }

  Future<void> getCardListing() async {
    Map<String, dynamic> data = {};
    data["collectionId"] = collectionId;
    data["userId"] = userId;
    var response = await ApiProvider().getCardListWithId(data,true);
    Logger().d(response);
    if (response.success == true) {
      cardList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }
}
