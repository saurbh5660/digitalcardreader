import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:digital_card_grader/core/models/chat_model.dart';
import 'package:digital_card_grader/core/models/message_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../common/db_helper.dart';
import '../../../common/socket_service.dart';

class MessageController extends GetxController {
  final SocketService _socketService = SocketService();
  RxList<dynamic> messages = <dynamic>[].obs;
  late String senderId;
  late String receiverId;
   RxString receiverName = ''.obs;
   RxString receiverImage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    receiverId = Get.arguments["receiverId"].toString();
    receiverName.value = Get.arguments?["receiverName"] ?? '';
    receiverImage.value = Get.arguments?["receiverImage"] ?? '';
    senderId = DbHelper()
        .getUserModel()
        ?.id
        .toString() ?? "";

    _loadChatMessages();
    _observeIncomingMessages();
  }

  void _loadChatMessages() {
    var messageData = {
      "senderId": senderId,
      "receiverId": receiverId,
    };
    Logger().d(messageData);
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


  void sendMessage(String messageText, int type) {
    if (messageText
        .trim()
        .isEmpty) return;

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
