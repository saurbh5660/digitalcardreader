import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final contactFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  Future<void> onContactUs() async {
    if (contactFormKey.currentState!.validate()) {
      Get.back();
    }
  }
}
