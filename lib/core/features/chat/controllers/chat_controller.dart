import 'package:digital_card_grader/core/models/chat_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../common/db_helper.dart';
import '../../../common/socket_service.dart';
import '../../../constants/app_images.dart';

class ChatController extends GetxController {
  final SocketService _socketService = SocketService();
  RxList<dynamic> messages = <dynamic>[].obs;
  late String senderId;
  late String receiverId;

  @override
  void onInit() {
    super.onInit();
    receiverId = Get.arguments["receiverId"].toString();
    senderId = DbHelper().getUserModel()?.id.toString() ?? "";

    _loadChatMessages();
    _observeIncomingMessages();
  }

  void _loadChatMessages() {
    var messageData = {
      "senderId": senderId,
      "receiverId": receiverId,
    };
    _socketService.getMesssages(messageData);
  }

  void _observeIncomingMessages() {
    _socketService.chatMessagesStream.listen((data) {
      if (data is Map<String, dynamic> && data['getdata'] is List) {
        List<dynamic> allMessages = data['getdata'];
        messages.value = allMessages.where((msg) {
          String msgSender = msg['senderId'].toString();
          String msgReceiver = msg['receiverId'].toString();
          return (msgSender == senderId && msgReceiver == receiverId) ||
              (msgSender == receiverId && msgReceiver == senderId);
        }).toList();
      }
      else if (data is Map<String, dynamic>) {
        String msgSender = data['senderId'].toString();
        String msgReceiver = data['receiverId'].toString();

        if ((msgSender == senderId && msgReceiver == receiverId) ||
            (msgSender == receiverId && msgReceiver == senderId)) {
          messages.add(data);
        }
      }
    });
  }


  void sendMessage(String messageText,int type) {
    if (messageText.trim().isEmpty) return;

    var messageData = {
      "senderId": senderId,
      "receiverId": receiverId,
      "message": messageText.trim(),
      "message_type": type,
    };
    Logger().d(messageData);
    _socketService.sendMessage(messageData);
  }

}
