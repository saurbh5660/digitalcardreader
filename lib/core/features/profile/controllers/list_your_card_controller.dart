import 'package:digital_card_grader/core/enums/card_collection_enum.dart';
import 'package:digital_card_grader/core/features/profile/controllers/profile_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../constants/app_images.dart';
import '../../../constants/app_routes.dart';
import '../../../models/card_model.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class ListYourCardController extends GetxController {
  final listCardFormKey = GlobalKey<FormState>();
  final selectedCollectionController = TextEditingController();
  final priceController = TextEditingController();
  final additionalNotesController = TextEditingController();
  CardCollectionEnum? selectedCardCollection;

  Future<void> onSubmit() async {
    if (listCardFormKey.currentState!.validate()) {
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

      Get.toNamed(
        AppRoutes.success,
        arguments: {
          "title": "Your listing was successful",
          "onPressed": () {
            Get.until((route) => Get.currentRoute == AppRoutes.dashboard);
            Get.find<DashboardController>().onChangeIndex(0);
          },
        },
      );
    }
  }
}
