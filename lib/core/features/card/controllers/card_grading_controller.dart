import 'dart:developer';

import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/features/card/controllers/add_card_detail_controller.dart';
import 'package:digital_card_grader/core/features/card/controllers/payment_controller.dart';
import 'package:digital_card_grader/core/models/card_model.dart';
import 'package:digital_card_grader/core/models/card_response.dart';
import 'package:get/get.dart';

class CardGradingController extends GetxController {
  final card = Rxn<Card>();

  @override
  void onInit() {
    super.onInit();
    startGardGrading();
  }

  Future<void> startGardGrading() async {
    final paymentController = Get.find<PaymentController>();
    log("image is ${paymentController.image.value}");
    card.value = paymentController.card;
  }

  Future<void> onContinue() async {
    Get.until((_) => Get.currentRoute == AppRoutes.dashboard);
    Get.toNamed(
      AppRoutes.success,
      arguments: {
        "title": "Your AI card grading was successful",
        "onPressed": () {
          Get.back();
        },
      },
    );
  }
}
