import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';

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

  contactUsValidation() async {
    if (nameController.text.trim().isEmpty) {
      Utils.showToast(message: 'Please enter name');
      return;
    }
    if (emailController.text.trim().isEmpty) {
      Utils.showToast(message: 'Please enter email');
      return;
    }
    if (!emailController.text.trim().isEmail) {
      Utils.showToast(message: 'Please enter valid email');
      return;
    }

    if (messageController.text.trim().isEmpty) {
      Utils.showToast(message: "Please enter message");
      return;
    }
    contactUsApi();
  }

  Future<void> contactUsApi() async {
    Map<String, dynamic> userData = {
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "description": messageController.text.trim(),
    };
    var response = await ApiProvider().contactUs(userData);
    if (response.success == true) {
      Get.back(result: true);
      return;
    } else {
      Utils.showToast(message: response.message);
    }
  }

}
