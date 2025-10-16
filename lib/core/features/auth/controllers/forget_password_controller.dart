import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/features/auth/screens/verification_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../constants/app_strings.dart';

class ForgetPasswordController extends GetxController {
  final emailController = TextEditingController();

  validateEmail() async {
    if (emailController.text.trim().isEmpty) {
      Utils.showToast(message: AppStrings.pleaseEnterEmail);
      return;
    }
    forgotPassword();
  }


  Future<void> forgotPassword() async {
    Map<String, dynamic> userData = {"email": emailController.text.trim()};

    var response = await ApiProvider().forgotPassword(userData);
    Logger().d(response);
    if (response.success == true) {
      Utils.showToast(message: "OTP sent Successfully");
      Get.toNamed(
        AppRoutes.verification,
        arguments: {'email': emailController.text.toString(), 'from': "forgot"},
      );
    } else {
      Utils.showToast(message: response.message);
    }
  }
}
