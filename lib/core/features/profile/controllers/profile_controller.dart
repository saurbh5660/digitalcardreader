import 'package:get/get.dart';

import '../../../constants/app_images.dart';
import '../../../models/card_model.dart';

class ProfileController extends GetxController {
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
}
