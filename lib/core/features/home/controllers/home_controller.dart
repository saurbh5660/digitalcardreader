import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:digital_card_grader/core/models/card_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../common/db_helper.dart';

class HomeController extends GetxController {
  final inputFocus = FocusNode();
  final inputController = TextEditingController();
  final isSearching = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    final isLoggedIn = DbHelper().getIsLoggedIn();

    Logger().d(isLoggedIn);
    inputFocus.addListener(() {
      if (inputFocus.hasFocus) {
        isSearching.value = true;
      }
    });
  }

  final cardList = Rx<List<CardModel>>([
    CardModel(
      id: 1,
      title: "Charizard",
      price: 320,
      image: AppImages.card,
      owner: "Derek Watakovski",
      ownerImage: AppImages.profile,
      rating: 9.5,
    ),
    CardModel(
      id: 2,
      title: "Shohei Ohtani",
      price: 750,
      image: AppImages.card,
      owner: "Derek Watakovski",
      ownerImage: AppImages.profile,
      rating: 8.7,
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
}
