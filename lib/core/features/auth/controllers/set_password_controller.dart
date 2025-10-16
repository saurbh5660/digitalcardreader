import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../constants/app_routes.dart';

class SetPasswordController extends GetxController {
  final setPasswordFormKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final hidePassword = RxBool(true);
  final hideConfirmPassword = RxBool(true);

  Future<void> onSetPassword() async {
    if (setPasswordFormKey.currentState!.validate()) {
      Get.until((route) => Get.currentRoute == AppRoutes.signin);
    }
  }
}
