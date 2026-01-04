import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../constants/app_routes.dart';
import '../../../models/card_list_response.dart';
import '../../../models/collection_response.dart';
import '../../../models/marketplace_response.dart';
import '../../../models/profile_response.dart';

class ViewProfileController extends GetxController {
  final selectedIndex = RxInt(0);
  var collectionList = <CollectionBody>[].obs;
  var profile = ProfileData().obs;
  var cardList = <CardList>[].obs;
  var marketList = <MarketList>[].obs;
  var id = '';
  var followStatus = 0.obs;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments?['id'] ?? '';
    getProfile();
    getCollection();
    getCardListing();
    getMarketListing();
  }

  void onChangeIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> getProfile() async {
    Map<String, dynamic> data = {'userId': id};
    var response = await ApiProvider().getProfile(data);
    Logger().d(response);
    if (response.success == true) {
      profile.value = response.body ?? ProfileData();
      followStatus.value = profile.value.response?.isFollow ?? 0;

    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> getCollection() async {
    Map<String, dynamic> data = {'userId': id};
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
    Map<String, dynamic> data = {'userId': id};
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
    Map<String, dynamic> data = {'userId': id};
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

  Future<void> onMessageSeller() async {
    Get.toNamed(
      AppRoutes.message,
      arguments: {
        'receiverId': profile.value.response?.id ?? '',
        'receiverImage': profile.value.response?.profilePicture ?? '',
        'receiverName': profile.value.response?.name ?? '',
      },
    );
  }

  Future<void> followUnfollow() async {
    int newStatus = 0;
    final iFollow = profile.value.response?.isFollow;
    if (iFollow == 0) {
      newStatus = 1;
    } else if (iFollow == 1) {
      newStatus = 0;
    } else {
      newStatus = 0;
    }
    Map<String, dynamic> data = {"followingId": profile.value.response?.id.toString()};
    var response = await ApiProvider().followUnfollow(data);
    if (response.success == true) {
      profile.value.response?.isFollow = newStatus;
      followStatus.value = newStatus;
    } else {
      Utils.showToast(message: response.message);
    }
  }
}
