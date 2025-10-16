import 'package:get/get.dart';

import '../../../constants/app_images.dart';
import '../../../constants/app_routes.dart';
import '../../../models/card_model.dart';
import '../../../models/chat_model.dart';

class ViewProfileController extends GetxController {
  final selectedIndex = RxInt(0);

  final cardList = Rx<List<CardModel>>([
    CardModel(
      id: 1,
      title: "Charizard",
      price: 320,
      image: AppImages.card,
      owner: "Derek Watakovski",
      ownerImage: AppImages.profile,
    ),
    CardModel(
      id: 2,
      title: "Shohei Ohtani",
      price: 750,
      image: AppImages.card,
      owner: "Derek Watakovski",
      ownerImage: AppImages.profile,
    ),
  ]);

  void onChangeIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> onMessageSeller() async {
    final chat = ChatModel(sender: "Ghostly", image: AppImages.profile);
    Get.toNamed(AppRoutes.message, arguments: chat);
  }
}
