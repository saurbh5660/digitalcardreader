import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../constants/app_routes.dart';

class ChangePasswordController extends GetxController {
  final changePasswordFormKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final hideOldPassword = RxBool(true);
  final hidePassword = RxBool(true);
  final hideConfirmPassword = RxBool(true);

  Future<void> onChangePassword() async {
    if (changePasswordFormKey.currentState!.validate()) {
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }
}
