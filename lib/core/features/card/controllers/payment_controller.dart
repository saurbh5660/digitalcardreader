import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/models/payment_card_model.dart';
import 'package:digital_card_grader/core/utils/card_scanner_util.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../models/card_response.dart';

class PaymentController extends GetxController {
  final paymentCards = Rx<List<PaymentCardModel>>([]);
  var card = Card();

  final addCardFormKey = GlobalKey<FormState>();
  final image = RxnString();
  final cardNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cardExpiryController = TextEditingController();
  final cardCvvController = TextEditingController();

  final isTermsAgreed = RxBool(false);
  final saveDetail = RxBool(false);

  Future<void> scanCard() async {
    final file = await CardScannerUtils.scanFromCamera();
    image.value = file?.path;
   /* if (file?.path != null) {
      uploadGrade();
    }*/
  }

  Future<void> addCard() async {
    if (addCardFormKey.currentState!.validate()) {
      paymentCards.value.add(
        PaymentCardModel(
          name: "Okechukwu Ozioma",
          bank: "FYI BANK",
          expiry: "5/26",
          card: "VISA",
          cvv: 234,
          number: 0000236383648269,
          type: "CREDIT",
        ),
      );
      paymentCards.refresh();
      clearDetails();
      Get.back();
    }
  }

 /* Future<void> uploadGrade() async {
    Map<String, dynamic> cardData = {};
    var response = await ApiProvider().uploadGrade(cardData, image.value ?? "");
    Logger().d(response);
    if (response.success == true) {
      card = response.body ?? Card();
      Get.toNamed(AppRoutes.cardGrading, arguments: {});
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }*/

  void clearDetails() {
    cardNameController.clear();
    cardNumberController.clear();
    cardExpiryController.clear();
    cardCvvController.clear();
  }
}
