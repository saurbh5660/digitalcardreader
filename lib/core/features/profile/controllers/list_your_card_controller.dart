import 'package:digital_card_grader/core/enums/card_collection_enum.dart';
import 'package:digital_card_grader/core/features/profile/controllers/profile_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../common/db_helper.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_routes.dart';
import '../../../models/card_list_response.dart';
import '../../../models/card_model.dart';
import '../../../models/collection_response.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class ListYourCardController extends GetxController {
  final listCardFormKey = GlobalKey<FormState>();
  final selectedCollectionController = TextEditingController();
  final priceController = TextEditingController();
  final additionalNotesController = TextEditingController();
  CardCollectionEnum? selectedCardCollection;

  var collectionList = <CollectionBody>[].obs;
  var selectedCollectionId = "".obs;
  var selectedCardId = "".obs;
  var cardList = <CardList>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCollection();
    getCardListing();
  }

  Future<void> getCollection() async {
    Map<String, dynamic> data = {'userId': DbHelper().getUserModel()?.id.toString()};
    var response = await ApiProvider().getCollection(data);
    Logger().d(response);
    if (response.success == true) {
      collectionList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> getCardListing() async {
    Map<String, dynamic> data = {
      'userId': DbHelper().getUserModel()?.id.toString(),
    };
    if (selectedCollectionId.isNotEmpty) {
      data["collectionId"] = selectedCollectionId.value;

    }
    var response = await ApiProvider().getCardListWithId(data);
    Logger().d(response);
    if (response.success == true) {
      cardList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> addToMarketPlace() async {
    if (selectedCardId.value.isEmpty) {
      Utils.showErrorToast(message: 'Please select card!');
      return;
    }
    if (priceController.text.trim().isEmpty) {
      Utils.showErrorToast(message: 'Please enter price!');
      return;
    }

    Map<String, dynamic> cardData = {
      'cardId': selectedCardId.value.toString(),
      'price': priceController.text.trim().toString(),
      'additionalNotes': additionalNotesController.text.trim().toString(),
    };
    var response = await ApiProvider().addToMarketPlace(cardData);
    Logger().d(response);
    if (response.success == true) {
      if (listCardFormKey.currentState!.validate()) {
        Get.toNamed(
          AppRoutes.success,
          arguments: {
            "title": "Card added to marketplace successfully",
            "onPressed": () {
              Get.until((route) => Get.currentRoute == AppRoutes.dashboard);
              Get.find<DashboardController>().onChangeIndex(0);
            },
          },
        );
      }
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }
}
