import 'dart:io';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../common/db_helper.dart';
import '../../../constants/app_strings.dart';

class SigninController extends GetxController {
  final singinFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = RxBool(true);
  var deviceToken = "";

  Future<void> login() async {
    if (emailController.text.trim().isEmpty) {
      Utils.showErrorToast(message: AppStrings.pleaseEnterEmail);
      return;
    }
    if (!emailController.text.trim().isEmail) {
      Utils.showErrorToast(message: AppStrings.pleaseEnterValidEmail);
      return;
    }
    if (passwordController.text.trim().isEmpty) {
      Utils.showErrorToast(message: AppStrings.pleaseEnterPassword);
      return;
    }

    String token = "";
    if (deviceToken.isEmpty) {
      token = "dddd";
    } else {
      token = deviceToken;
    }

    Map<String, dynamic> userData = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "deviceToken": token,
      "deviceType": Platform.isAndroid ? "1" : "2",
    };

    var response = await ApiProvider().loginApi(userData);
    if (response.success == true) {
      DbHelper().saveIsLoggedIn(true);
      DbHelper().saveUserModel(response.body);
      DbHelper().saveUserToken(response.body?.token ?? "");
      Get.toNamed(AppRoutes.dashboard);
    } else {
      Utils.showToast(message: response.message ?? "Login failed");
    }
  }
}
