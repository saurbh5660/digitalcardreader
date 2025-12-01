import 'package:digital_card_grader/core/models/card_list_response.dart';
import 'package:digital_card_grader/core/models/profile_response.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../constants/app_images.dart';
import '../../../models/card_model.dart';
import '../../../models/collection_response.dart';

class ProfileController extends GetxController {
  final selectedIndex = RxInt(0);
  var collectionList = <CollectionBody>[].obs;
  var profile = ProfileData().obs;
  var cardList = <CardList>[].obs;
  var listingList = <CardModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    getProfile();
    getCollection();
    getCardListing();
    getListings();
  }

  void onChangeIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> getProfile() async {
    var response = await ApiProvider().getProfile();
    Logger().d(response);
    if (response.success == true) {
      profile.value = response.body ?? ProfileData();
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> getCollection() async {
    var response = await ApiProvider().getCollection();
    Logger().d(response);
    if (response.success == true) {
      collectionList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> getCardListing() async {
    var response = await ApiProvider().getCardList();
    Logger().d(response);
    if (response.success == true) {
      cardList.value = response.body ?? [];
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }


  Future<void> getListings() async {
    listingList.value = [
      CardModel(
        id: 3,
        title: "Pikachu",
        price: 150,
        image: AppImages.card,
        owner: "Derek Watakovski",
        ownerImage: AppImages.profile,
      ),
      CardModel(
        id: 4,
        title: "Blastoise",
        price: 280,
        image: AppImages.card,
        owner: "Derek Watakovski",
        ownerImage: AppImages.profile,
      ),
    ];
  }

  // Getter for current list based on selected tab
  List<dynamic> get currentList {
    switch (selectedIndex.value) {
      case 0: // Collections
        return collectionList;
      case 1: // Cards
        return cardList;
      case 2: // Listings
        return listingList;
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
        return listingList.isEmpty;
      default:
        return true;
    }
  }
}