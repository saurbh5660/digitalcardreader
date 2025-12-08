import 'package:digital_card_grader/core/features/browse/controllers/browse_controller.dart';
import 'package:digital_card_grader/core/features/card/controllers/add_card_detail_controller.dart';
import 'package:digital_card_grader/core/features/chat/controllers/chat_controller.dart';
import 'package:get/get.dart';
import '../../../common/socket_service.dart';

class DashboardController extends GetxController {
  final currentIndex = RxInt(0);
  final socketService = SocketService();

  void onChangeIndex(int index) {
    currentIndex.value = index;
    switch (index) {
      case 1:
        Get.lazyPut(() => BrowseController());
      case 2:
        Get.delete<AddCardDetailController>();
        Get.lazyPut(() => AddCardDetailController());
      case 3:
        Get.lazyPut(() => ChatController());
    }
  }

  @override
  void onInit() {
    super.onInit();
    socketService.connectToServer();
  }
}
