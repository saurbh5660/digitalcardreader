import 'dart:async';
import 'dart:math';
import 'package:digital_card_grader/core/common/db_helper.dart';
import 'package:digital_card_grader/core/models/card_list_response.dart';
import 'package:digital_card_grader/core/models/marketplace_response.dart';
import 'package:digital_card_grader/core/models/profile_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
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
  var packUsed = 0.obs;

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
    Map<String, dynamic> data = {
      'userId': DbHelper().getUserModel()?.id.toString(),
    };
    var response = await ApiProvider().getProfile(data);
    Logger().d(response);
    if (response.success == true) {
      profile.value = response.body ?? ProfileData();
      packUsed.value = response.body?.packUsed ?? 0;
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> getCollection() async {
    Map<String, dynamic> data = {
      'userId': DbHelper().getUserModel()?.id.toString(),
    };
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
    Map<String, dynamic> data = {
      'userId': DbHelper().getUserModel()?.id.toString(),
    };
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

  bool evaluateWin(int number) {
    // int pack = int.parse(profile.value.packType ?? "0");
    int pack = 3;

    if (pack == 0) return false; // Not allowed
    if (pack == 3) return true; // 100% win

    double probability = 0.0;

    if (pack == 1) probability = 0.05; // 5%
    if (pack == 2) probability = 0.50; // 50%

    double randomValue = Random().nextDouble();
    return randomValue < probability;
  }

  Future<void> showFortuneWheelDialog(
    BuildContext context,
    Function(int) onSpin,
  ) async {
    StreamController<int> selected = StreamController<int>();

    // Wheel slices
    final sections = [
      "0–10",
      "11–25",
      "26–40",
      "41–55",
      "56–70",
      "71–85",
      "86–95",
      "96–100",
    ];

    // Mapped ranges
    final List<List<int>> ranges = [
      [0, 10],
      [11, 25],
      [26, 40],
      [41, 55],
      [56, 70],
      [71, 85],
      [86, 95],
      [96, 100],
    ];

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            height: 420,
            child: Column(
              children: [
                Text(
                  "🎡 Spin the Wheel!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 14),

                Expanded(
                  child: FortuneWheel(
                    selected: selected.stream,
                    animateFirst: false,
                    items: [
                      for (var label in sections)
                        FortuneItem(
                          child: Text(label, style: TextStyle(fontSize: 14)),
                        ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    int randomIndex = Fortune.randomInt(0, 101);
                    selected.add(randomIndex);

                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.pop(context);
                      onSpin(randomIndex);
                    });
                  },
                  child: Text("SPIN NOW"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> limitedBorder(int hasLimited) async {
    Map<String, dynamic> data = {"hasLimited": hasLimited};
    var response = await ApiProvider().limitedBorder(data);
    if (response.success == true) {
      getProfile();
      getCollection();
      getCardListing();
      getMarketListing();
    } else {
      Utils.showToast(message: response.message);
    }
  }
}
