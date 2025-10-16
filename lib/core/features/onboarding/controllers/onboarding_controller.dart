import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  
  Future<void> onGetStarted() async {
    Get.toNamed(AppRoutes.signin);
  }
}
