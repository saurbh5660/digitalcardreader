import 'dart:io';

import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../common/db_helper.dart';
import '../../../constants/app_routes.dart';

class SignupController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = RxBool(true);
  var deviceToken = "";

  /*
  Future<void> onSignup() async {
    if (signupFormKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.verification);
    }
  }*/

  /*Future<void> getToken() async{
    deviceToken = await NotificationService.getFCMToken() ?? "";
  }*/
  validationSignup() async {
    if (nameController.text.trim().isEmpty) {
      Utils.showToast(message: AppStrings.pleaseEnterName);
      return;
    }

    if (emailController.text.trim().isEmpty) {
      Utils.showToast(message: AppStrings.pleaseEnterEmail);
      return;
    }
    if (!emailController.text.trim().isEmail) {
      Utils.showToast(message: AppStrings.pleaseEnterValidEmail);
      return;
    }
    if (passwordController.text.trim().isEmpty) {
      Utils.showToast(message: AppStrings.pleaseEnterPassword);
      return;
    }
    if (passwordController.text.trim().length < 6) {
      Utils.showToast(message: AppStrings.pleaseEnterValidPassword);
      return;
    }
    signupApi();
  }

  Future<void> signupApi() async {
    String deviceToken = await FirebaseMessaging.instance.getToken() ?? "";

    Map<String, dynamic> userData = {
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "deviceToken": deviceToken,
      "deviceType": Platform.isAndroid ? "1" : "2",
    };

    var response = await ApiProvider().signUp(userData);
    Logger().d(response);
    if (response.success == true) {
      // Utils.showToast(message: "Your static otp is 1111.");
      DbHelper().saveUserModel(response.body);
      DbHelper().saveUserToken(response.body?.token ?? "");
      Get.toNamed(
        AppRoutes.verification,
        arguments: {'email': emailController.text.toString(), 'from': "signup"},
      );
      return;
    } else {
      Utils.showToast(message: response.message);
    }
  }
}
