import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../network/api_provider.dart';
import '../../../common/apputills.dart';
import '../../../constants/app_routes.dart';
import '../../../models/card_response.dart';
import '../../../utils/card_scanner_util.dart';

class CardUploadController extends GetxController {
  final frontCard = RxnString();
  final backCard = RxnString();
  var frontCardData = Card();
  var backCardData = Card();

  Future<void> scanFrontCard() async {
    final file = await CardScannerUtils.scanFromCamera();
    frontCard.value = file?.path;
  }

  Future<void> scanBackCard() async {
    final file = await CardScannerUtils.scanFromCamera();
    backCard.value = file?.path;
  }

  void removeFront() => frontCard.value = null;

  void removeBack() => backCard.value = null;


  Future<void> uploadFrontGrade() async {
    Map<String, dynamic> cardData = {};
    var response = await ApiProvider().uploadGrade(cardData, frontCard.value ?? "");
    Logger().d(response);
    if (response.success == true) {
      frontCardData = response.body ?? Card();
      Get.offNamed(AppRoutes.uploadBackCard, arguments: {'frontCard':frontCardData});
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }

  Future<void> uploadBackGrade() async {
    Map<String, dynamic> cardData = {};
    var response = await ApiProvider().uploadGrade(cardData, backCard.value ?? "");
    Logger().d(response);
    if (response.success == true) {
      backCardData = response.body ?? Card();
      frontCardData = Get.arguments?['frontCard'] ?? Card();
      Get.offNamed(AppRoutes.cardGrading, arguments: {'frontCard':frontCardData,'backCard':backCardData});
      return;
    } else {
      Utils.showErrorToast(message: response.message);
    }
  }
}
