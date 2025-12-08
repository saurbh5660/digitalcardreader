import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../constants/app_routes.dart';

class ChangePasswordController extends GetxController {
  final changePasswordFormKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final hideOldPassword = RxBool(true);
  final hidePassword = RxBool(true);
  final hideConfirmPassword = RxBool(true);

  validationAddFeed() async {
    if (oldPasswordController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter old password.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (passwordController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter new password.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter confirm password.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (confirmPasswordController.text.trim() != passwordController.text.trim()) {
      Get.snackbar(
        "Error",
        "Password and confirm password should be same.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    changePassword();
  }

  Future<void> changePassword() async {
    Map<String, dynamic> data = {
      "currentPassword": oldPasswordController.text.trim().toString(),
      "newPassword": passwordController.text.trim().toString(),
    };
    var response = await ApiProvider().changePassword(data);
    if (response.success == true) {
      Get.back(result: true);
    } else {
      Utils.showToast(message: response.message);
    }
  }

}
