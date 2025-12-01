import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/enums/card_collection_enum.dart';
import 'package:digital_card_grader/core/features/profile/controllers/profile_controller.dart';
import 'package:digital_card_grader/core/utils/camera_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/web.dart';

import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../constants/app_images.dart';
import '../../../models/card_model.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class AddCollectionController extends GetxController {
  final collectionImage = RxString("");
  final addCollectionFormKey = GlobalKey<FormState>();
  final selectedCollectionTypeController = TextEditingController();
  final collectionName = TextEditingController();
  CardCollectionEnum? selectedCollectionType;

  Future<void> selectCollectionImage(bool isCamera) async {
    if (isCamera) {
      final file = await CameraUtils.openCamera();
      if (file != null) {
        collectionImage.value = file.path;
      }
    } else {
      final file = await CameraUtils.openGallery();
      if (file != null) {
        collectionImage.value = file.path;
      }
    }
  }

  Future<void> addCollection() async {
    if (collectionName.text.trim().isEmpty) {
      Utils.showErrorToast(message: "Please enter collection name");
      return;
    }
    if (collectionImage.value.isEmpty) {
      Utils.showErrorToast(message: "Please select collection image");
      return;
    }
    Map<String, dynamic> addCollection = {
      "cardName": collectionName.text.trim(),
      // "cardType": "0",
    };

    var response = await ApiProvider().addCollection(addCollection, collectionImage.value ?? "");
    Logger().d(response);
    if (response.success == true) {
      Get.offNamed(
        AppRoutes.success,
        arguments: {
          "title":
          "Your Collection Addition was successful",
          "onPressed": () {
            Get.until(
                  (route) =>
              Get.currentRoute == AppRoutes.dashboard,
            );
            Get.find<DashboardController>().onChangeIndex(
              0,
            );
          },
        },
      );
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> onSubmit() async {
    if (collectionImage.value.isEmpty) {
      Utils.showErrorToast(message: "Please select collection image");
      return;
    }
    if (addCollectionFormKey.currentState!.validate()) {
      Get.back();
    }
  }
}
