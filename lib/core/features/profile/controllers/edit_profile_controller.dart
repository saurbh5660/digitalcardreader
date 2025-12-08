import 'package:digital_card_grader/core/utils/camera_utils.dart';
import 'package:digital_card_grader/network/api_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../common/db_helper.dart';
import '../../../models/profile_response.dart';

class EditProfileController extends GetxController {
  final editProfileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  var profile = ProfileData().obs;
  final profileImages = RxnString();

  @override
  onInit(){
    super.onInit();
    getProfile();
  }

  Future<void> selectProfile() async {
    final file = await CameraUtils.openDialog();
    profileImages.value = file?.path;
  }

  Future<void> getProfile() async {
    var response = await ApiProvider().getProfile();
    Logger().d(response);
    if (response.success == true) {
      profile.value = response.body ?? ProfileData();
      if((profile.value.profilePicture ?? '').toString().isNotEmpty){
        profileImages.value = ApiConstants.userImageUrl+(profile.value.profilePicture ?? '');
      }
      nameController.text = profile.value.name ?? '';
      bioController.text = profile.value.bio ?? '';
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  validationUpdate() async {
    if (nameController.text
        .trim()
        .isEmpty) {
      Utils.showToast(message: 'Please enter name!');
      return;
    }


    updateProfileApi();
  }

  Future<void> updateProfileApi() async {
    Map<String, dynamic> userData = {
      "name": nameController.text.trim(),
      "bio": bioController.text.trim(),
    };

    var response = await ApiProvider().updateProfile(userData,profileImages.value ?? "");
    if (response.success == true) {
      DbHelper().saveUserModel(response.body);
      Get.back(result: true);
    } else {
      Utils.showToast(message: response.message);
    }
  }



}
