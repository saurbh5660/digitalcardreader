import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/enums/card_collection_enum.dart';
import 'package:digital_card_grader/core/features/profile/controllers/profile_controller.dart';
import 'package:digital_card_grader/core/utils/camera_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/app_images.dart';
import '../../../models/card_model.dart';

class AddCollectionController extends GetxController {
  final collectionImage = RxnString();
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

  Future<void> onSubmit() async {
    if (addCollectionFormKey.currentState!.validate()) {
      Get.back();
      // Get.find<ProfileController>().cardList
      //   ..value.add(
      //     CardModel(
      //       id: 1,
      //       title: "Charizard",
      //       price: 320,
      //       image: AppImages.card,
      //       owner: "Derek Watakovski",
      //       ownerImage: AppImages.profile,
      //     ),
      //   )
      //   ..refresh();
    }
  }
}
