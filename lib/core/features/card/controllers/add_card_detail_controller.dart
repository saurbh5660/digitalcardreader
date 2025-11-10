import 'package:digital_card_grader/core/enums/card_type_enum.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../constants/app_routes.dart';
import '../../../models/card_response.dart';
import '../../../models/payment_card_model.dart';
import '../../../utils/card_scanner_util.dart';

class AddCardDetailController extends GetxController {
  final addCardFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final additionalNoteController = TextEditingController();
  CardTypeEnum? selectedCardType;
  final paymentCards = Rx<List<PaymentCardModel>>([]);
  final image = RxnString();
  var card = Card();

  Future<void> onAiScan() async {
    if (addCardFormKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.payment);
    }
  }

  Future<void> scanCard() async {
    final file = await CardScannerUtils.scanFromCamera();
    image.value = file?.path;
    if (file?.path != null) {
      uploadGrade();
    }
  }

  Future<void> uploadGrade() async {
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
  }
}
