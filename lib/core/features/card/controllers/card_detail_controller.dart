import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/models/card_model.dart';
import 'package:digital_card_grader/core/models/chat_model.dart';
import 'package:get/get.dart';

import '../../../models/marketplace_response.dart';

class CardDetailController extends GetxController {
   Rx<MarketList> card = Rx(MarketList());

  @override
  onInit(){
    super.onInit();
    card.value =  Get.arguments?['cardList'] ?? MarketList();
  }

  Future<void> onMessageSeller() async {
    // final chat = ChatModel(sender: card.value.user?.name, image: card.value.user?.profilePicture,id: int.parse(card.value.user?.id ?? "0"));
    Get.toNamed(AppRoutes.message, arguments: {
      'receiverId':card.value.user?.id ?? '',
      'receiverImage':card.value.user?.profilePicture ?? '',
      'receiverName':card.value.user?.name ?? '',
    });
  }
}
