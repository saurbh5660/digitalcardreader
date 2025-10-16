import 'package:digital_card_grader/core/enums/card_type_enum.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../constants/app_routes.dart';

class AddCardDetailController extends GetxController {
  final addCardFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final additionalNoteController = TextEditingController();
  CardTypeEnum? selectedCardType;

  Future<void> onAiScan() async {
    if (addCardFormKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.payment);
    }
  }
}
