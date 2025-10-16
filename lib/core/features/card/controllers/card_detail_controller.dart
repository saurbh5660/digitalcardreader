import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/models/card_model.dart';
import 'package:digital_card_grader/core/models/chat_model.dart';
import 'package:get/get.dart';

class CardDetailController extends GetxController {
  final card = Get.arguments as CardModel;

  Future<void> onMessageSeller() async {
    final chat = ChatModel(sender: card.owner, image: card.ownerImage);
    Get.toNamed(AppRoutes.message, arguments: chat);
  }
}
