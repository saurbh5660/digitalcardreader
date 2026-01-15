import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Dialog, showDialog, ElevatedButton;
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';

class PacksController extends GetxController {
  final PageController pageController = PageController(viewportFraction: 0.85);
  var currentPage = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(_pageListener);
  }

  void _pageListener() {
    currentPage.value = pageController.page ?? 0.0;
  }

  @override
  void onClose() {
    pageController.removeListener(_pageListener);
    pageController.dispose();
    super.onClose();
  }

  Future<void> packBuy(int type) async {
    Logger().d("asfdsgdgdsgdsgds");
    Map<String, dynamic> data = {
      "packType": type,
    };
    var response = await ApiProvider().packBuy(data);
    if (response.success == true) {
      _startWheelProcess(type);
      // Get.back(result: true);
      // Utils.showToast(message: 'Pack bought successfully!');

    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> addInventory() async {
    var response = await ApiProvider().addInventory();
    if (response.success == true) {

    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  void _startWheelProcess(int type) {
    showFortuneWheelDialog((randomIndex) {
      bool isWinner = evaluateWin(randomIndex, type);

      if (isWinner) {
        addInventory();
        Get.back(result: true);

        Utils.showToast(
            message: "🎉 Success! You've unlocked the Limited Border!");
      } else {

        Get.back(result: true);
        Utils.showErrorToast(message: "Better luck next time!");

      }
    });
  }

  bool evaluateWin(int number, int packType) {
    if (packType == 2) return true;

    double probability = 0.0;
    if (packType == 0) probability = 0.05;
    if (packType == 1) probability = 0.50;

    double randomValue = Random().nextDouble();
    return randomValue < probability;
  }


  Future<void> showFortuneWheelDialog(Function(int) onSpin) async {
    final StreamController<int> selected = StreamController<int>();

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

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 420,
          child: Column(
            children: [
              const Text(
                "🎡 Spin the Wheel!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),

              Expanded(
                child: FortuneWheel(
                  selected: selected.stream,
                  animateFirst: false,
                  items: [
                    for (var label in sections)
                      FortuneItem(
                        child: Text(label, style: const TextStyle(fontSize: 14)),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  int randomIndex = Fortune.randomInt(0, 101);
                  selected.add(randomIndex);

                  Future.delayed(const Duration(seconds: 3), () {
                    Get.back(); // close dialog
                    onSpin(randomIndex);
                  });
                },
                child: const Text("SPIN NOW"),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }


}