import 'package:digital_card_grader/core/common/db_helper.dart';
import 'package:digital_card_grader/core/models/card_list_response.dart';
import 'package:digital_card_grader/core/models/marketplace_response.dart';
import 'package:digital_card_grader/core/models/profile_response.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../models/collection_response.dart';

class ProfileController extends GetxController {
  final selectedIndex = RxInt(0);
  var collectionList = <CollectionBody>[].obs;
  var profile = ProfileData().obs;
  var cardList = <CardList>[].obs;
  var marketList = <MarketList>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getCollection();
    getCardListing();
    getMarketListing();
  }

  void onChangeIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> getProfile() async {
    Map<String, dynamic> data = {'userId': DbHelper().getUserModel()?.id.toString()};
    var response = await ApiProvider().getProfile(data);
    Logger().d(response);
    if (response.success == true) {
      profile.value = response.body ?? ProfileData();
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
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
    Map<String, dynamic> data = {'userId': DbHelper().getUserModel()?.id.toString()};
    var response = await ApiProvider().getCardList(data);
    Logger().d(response);
    if (response.success == true) {
      cardList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> getMarketListing() async {
    Map<String, dynamic> data = {'userId': DbHelper().getUserModel()?.id.toString()};
    var response = await ApiProvider().getMarketPlace(data);
    Logger().d(response);
    if (response.success == true) {
      marketList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }


  List<dynamic> get currentList {
    switch (selectedIndex.value) {
      case 0: // Collections
        return collectionList;
      case 1: // Cards
        return cardList;
      case 2: // Listings
        return marketList;
      default:
        return [];
    }
  }

  // Check if current list is empty
  bool get isCurrentListEmpty {
    switch (selectedIndex.value) {
      case 0:
        return collectionList.isEmpty;
      case 1:
        return cardList.isEmpty;
      case 2:
        return marketList.isEmpty;
      default:
        return true;
    }
  }
}