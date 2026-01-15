import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../models/card_list_response.dart';
import '../../../models/inventory_response.dart';

class InventoryController extends GetxController {
  var inventoryList = <InventoryBody>[].obs;

  @override
  void onInit() {
    super.onInit();
    Logger().d("DSVDSGdsgdfdffhfgh");
    getInventoryList();
  }

  Future<void> getInventoryList() async {
    var response = await ApiProvider().getInventoryList();
    Logger().d(response);
    if (response.success == true) {
      inventoryList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }
}
