import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:digital_card_grader/core/models/chat_model.dart';
import 'package:digital_card_grader/core/models/message_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final chat = Get.arguments as ChatModel;
  final inputController = TextEditingController();

  final messages = Rx<List<MessageModel>>([
    MessageModel(
      id: "1",
      message: "Hey, how are you?",
      senderImage: AppImages.profile,
      senderId: "user_001",
    ),
    MessageModel(
      id: "2",
      message: "I’m good! What about you?",
      senderImage: AppImages.profile,
      senderId: "user_002",
    ),
    MessageModel(
      id: "3",
      message: "Doing great, thanks for asking 🙌",
      senderImage: AppImages.profile,
      senderId: "user_001",
    ),
    MessageModel(
      id: "4",
      message: "Have you finished the project?",
      senderImage: AppImages.profile,
      senderId: "user_001",
    ),
    MessageModel(
      id: "5",
      message: "Almost! I’ll send it over tonight.",
      senderImage: AppImages.profile,
      senderId: "user_002",
    ),
    MessageModel(
      id: "6",
      message: "Perfect 👌 Thanks a lot!",
      senderImage: AppImages.profile,
      senderId: "user_001",
    ),
    MessageModel(
      id: "7",
      message: "No worries. By the way, did you check the new update?",
      senderImage: AppImages.profile,
      senderId: "user_002",
    ),
    MessageModel(
      id: "8",
      message: "Yes! Looks amazing 🔥",
      senderImage: AppImages.profile,
      senderId: "user_001",
    ),
    MessageModel(
      id: "9",
      message: "Let’s catch up tomorrow at the café?",
      senderImage: AppImages.profile,
      senderId: "user_002",
    ),
    MessageModel(
      id: "10",
      message: "Sounds good ☕ See you at 5?",
      senderImage: AppImages.profile,
      senderId: "user_001",
    ),
  ]);
}
