import 'package:digital_card_grader/core/utils/camera_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final profile = RxnString();
  final editProfileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final bioController = TextEditingController();

  Future<void> selectProfile() async {
    final file = await CameraUtils.openDialog();
    profile.value = file?.path;
  }

  Future<void> onSaveProfile() async {
    if (editProfileFormKey.currentState!.validate()) {
      Get.back();
    }
  }
}
