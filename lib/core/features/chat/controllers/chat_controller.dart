import 'package:digital_card_grader/core/models/chat_model.dart';
import 'package:get/get.dart';

import '../../../constants/app_images.dart';

class ChatController extends GetxController {
  final chats = Rx<List<ChatModel>>([
    ChatModel(
      id: 1,
      sender: "Alice",
      image: AppImages.profile,
      message: "Hey, how are you doing?",
      time: "10:15 AM",
    ),
    ChatModel(
      id: 2,
      sender: "Bob",
      image: AppImages.profile,
      message: "I’m good, just got back from work.",
      time: "10:16 AM",
    ),
    ChatModel(
      id: 3,
      sender: "Alice",
      image: AppImages.profile,
      message: "Nice! Wanna catch up later?",
      time: "10:17 AM",
    ),
    ChatModel(
      id: 4,
      sender: "Bob",
      image: AppImages.profile,
      message: "Sure, let’s meet at the café around 6.",
      time: "10:18 AM",
    ),
    ChatModel(
      id: 5,
      sender: "Alice",
      image: AppImages.profile,
      message: "Perfect, see you there! ☕",
      time: "10:19 AM",
    ),
  ]);
}
