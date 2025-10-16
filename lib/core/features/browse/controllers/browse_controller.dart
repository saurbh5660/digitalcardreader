import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../constants/app_images.dart';
import '../../../models/card_model.dart';

class BrowseController extends GetxController {
  final inputFocus = FocusNode();
  final inputController = TextEditingController();
  final isSearching = RxBool(false);

  final cardList = Rx<List<CardModel>>([
    CardModel(
      id: 1,
      title: "Charizard",
      price: 320,
      image: AppImages.card,
      owner: "Derek Watakovski",
      ownerImage: AppImages.profile,
    ),
    CardModel(
      id: 2,
      title: "Shohei Ohtani",
      price: 750,
      image: AppImages.card,
      owner: "Derek Watakovski",
      ownerImage: AppImages.profile,
    ),
  ]);

  final searchHistory = Rx<List<String>>([
    "Mona Lisa",
    "NFT",
    "Artists",
    "Art",
    "Impressionists",
    "Cubism",
    "3D",
    "Exhibition",
    "NFT",
  ]);

  @override
  void onInit() {
    super.onInit();
    inputFocus.addListener(() {
      if (inputFocus.hasFocus) {
        isSearching.value = true;
      }
    });
  }
}
