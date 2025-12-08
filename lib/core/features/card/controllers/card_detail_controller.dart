import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/models/card_model.dart';
import 'package:digital_card_grader/core/models/chat_model.dart';
import 'package:get/get.dart';

import '../../../models/marketplace_response.dart';

class CardDetailController extends GetxController {
  final card = Get.arguments as MarketList;

  Future<void> onMessageSeller() async {
    final chat = ChatModel(sender: card.user?.name, image: card.user?.profilePicture,id: int.parse(card.user?.id ?? "0"));
    Get.toNamed(AppRoutes.message, arguments: chat);
  }
}
