import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/features/card/controllers/add_card_detail_controller.dart';
import 'package:digital_card_grader/core/models/card_response.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class CardGradingController extends GetxController {
  var frontCardData = Rxn<Card>();
  var backCardData = Rxn<Card>();

  @override
  void onInit() {
    super.onInit();
    startGardGrading();
  }

  Future<void> startGardGrading() async {
    frontCardData.value = Get.arguments?['frontCard'];
    backCardData.value = Get.arguments?['backCard'];
    saveImageData();
  }

  Future<void> onContinue() async {
    Get.until((_) => Get.currentRoute == AppRoutes.dashboard);
    Get.offNamed(
      AppRoutes.success,
      arguments: {
        "title": "Your AI card grading was successful",
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
  }

  Future<void> saveImageData() async {
    final addCardController = Get.find<AddCardDetailController>();
    var type = 0;
    if (addCardController.typeController.text.trim().toString() == 'Pokemon') {
      0;
    }else{
      1;
    }
    Map<String, dynamic> cardData = {
      'imagePath': frontCardData.value?.savedPath ?? '',
      'cardName': addCardController.nameController.text.trim(),
      'cardType': type,
      'additionalNotes': addCardController.additionalNoteController.text.trim(),
      'centering': frontCardData.value?.scores?.centering ?? '',
      'edges': frontCardData.value?.scores?.edges ?? '',
      'surface': frontCardData.value?.scores?.surface ?? '',
      'corners': frontCardData.value?.scores?.corners ?? '',
      'overall': frontCardData.value?.scores?.overall ?? '',
      'backImagePath': backCardData.value?.savedPath ?? '',
      'backCentering': backCardData.value?.scores?.centering ?? '',
      'backEdges': backCardData.value?.scores?.edges ?? '',
      'backSurface': backCardData.value?.scores?.surface ?? '',
      'backCorners': backCardData.value?.scores?.corners ?? '',
      'backOverall': backCardData.value?.scores?.overall ?? '',
    };
    if (addCardController.selectedCollectionId.value.isNotEmpty) {
      cardData['collectionId'] = addCardController.selectedCollectionId.value;
    }
    var response = await ApiProvider().saveImageData(cardData);
    Logger().d(response);
    if (response.success == true) {
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }
}
