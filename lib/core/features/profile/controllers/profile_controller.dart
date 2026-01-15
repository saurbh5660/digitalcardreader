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
import '../../../constants/app_colors.dart';
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
      // packUsed.value = response.body?.packUsed ?? 0;
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

  void showPackSelectionDialog(BuildContext context, List<PackBuyList> packs, String cardId) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          color: Color(0xFFF8F9FA), // Slightly off-white for a premium feel
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle Bar for BottomSheet
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
            ),
            const Text(
              "SELECT YOUR PACK",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: 1.2),
            ),
            const SizedBox(height: 5),
            Text(
              "Each pack has different limited border odds",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.85,
                ),
                itemCount: packs.length,
                itemBuilder: (context, index) {
                  final pack = packs[index];
                  return _buildPackCard(pack, context, cardId);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildPackCard(PackBuyList pack, BuildContext context, String cardId) {
    // Define Colors based on Pack Type
    Color primaryColor;
    List<Color> gradientColors;
    String packTitle;

    if (pack.packType == "0") {
      packTitle = "BRONZE";
      primaryColor = const Color(0xFFCD7F32);
      gradientColors = [const Color(0xFFCD7F32), const Color(0xFF804A00)];
    } else if (pack.packType == "1") {
      packTitle = "SILVER";
      primaryColor = const Color(0xFFC0C0C0);
      gradientColors = [const Color(0xFFE0E0E0), const Color(0xFF757575)];
    } else {
      packTitle = "GOLD";
      primaryColor = const Color(0xFFFFD700);
      gradientColors = [const Color(0xFFFFD700), const Color(0xFFB8860B)];
    }

    return GestureDetector(
      onTap: () {
        Get.back();
        _startWheelProcess(context, pack, cardId);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background Decorative Icon
            Positioned(
              right: -10,
              bottom: -10,
              child: Icon(Icons.star, size: 80, color: Colors.white.withOpacity(0.15)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.auto_awesome, color: Colors.white, size: 28),
                  const Spacer(),
                  Text(
                    packTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "PACK",
                    style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "SPIN NOW",
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startWheelProcess(BuildContext context, PackBuyList pack,String cardId) {
    showFortuneWheelDialog(context, (randomIndex) {
      bool isWinner = evaluateWin(randomIndex, int.parse(pack.packType ?? "0"));
      if (isWinner) {
        Utils.showToast(message: "🎉 Success! You've unlocked the Limited Border!");
        // limitedBorder(
        //     1,
        //     cardId,
        //     pack.id ?? ""
        // );
      } else {
        Utils.showErrorToast(message: "Better luck next time!");
        // limitedBorder(0, cardId, pack.id ??'');
      }
    });
  }

  bool evaluateWin(int number,int packType) {
    // int pack = int.parse(profile.value.packType ?? "0");
    int pack = packType;
    // if (pack == 0) return false;
    if (pack == 2) return true;
    double probability = 0.0;
    if (pack == 0) probability = 0.05;
    if (pack == 1) probability = 0.50;
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
                      Get.back();
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

  Future<void> limitedBorder(String cardId) async {
    Map<String, dynamic> data = {
      "hasLimited": "1",
      "cardId": cardId,
      // "packBuyId": packBuyId,
    };
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
