import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/features/auth/screens/verification_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../common/db_helper.dart';

class VerficationController extends GetxController {
  final verificationFormKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  RxString email = ''.obs;
  String from = '';

  @override
  void onInit() {
    super.onInit();
    email.value = Get.arguments?['email'] ?? '';
    from = Get.arguments?['from'] ?? '';
  }

 /* Future<void> onVerify(VerificationTypeEnum type) async {
    if (verificationFormKey.currentState!.validate()) {
      switch (type) {
        case VerificationTypeEnum.otp:
          Get.offAllNamed(AppRoutes.dashboard);
        case VerificationTypeEnum.forgetPassword:
          Get.toNamed(AppRoutes.setPassword);
      }
    }
  }*/

  validateOtp() async {
    if (otpController.text.trim().isEmpty) {
      Utils.showToast(message: AppStrings.pleaseEnterOtp);
      return;
    }
    verifyApi();
  }

  Future<void> verifyApi() async {
    Map<String, dynamic> userData = {
      "otp": otpController.text.trim(),
      // "email": email.value.trim(),
    };

    if (from == "signup") {
      var response = await ApiProvider().otpVerify(userData);
      Logger().d(response);
      if (response.success == true) {
        DbHelper().saveIsLoggedIn(true);
        Get.offAllNamed(AppRoutes.dashboard);
      } else {
        Utils.showToast(message: response.message);
      }
    } else {
      Get.toNamed(AppRoutes.setPassword);
    }
  }

  Future<void> resendOtpApi() async {
    Map<String, dynamic> userData = {"email": email.value.trim()};

    var response = await ApiProvider().resendOtp(userData);
    Logger().d(response);
    if (response.success == true) {
      Utils.showToast(message: "OTP Resend Successfully");
    } else {
      Utils.showToast(message: response.message);
    }
  }
}
