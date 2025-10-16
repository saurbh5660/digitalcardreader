import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/constants/app_icons.dart';
import 'package:digital_card_grader/core/features/chat/controllers/chat_controller.dart';
import 'package:digital_card_grader/core/features/chat/widgets/chat_card.dart';
import 'package:digital_card_grader/core/features/chat/widgets/chat_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_routes.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Chat",
        isLeading: false,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.profile),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Image.asset(AppIcons.profile, height: 20, width: 20),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ChatSearchbar(),
              Expanded(
                child: Obx(() {
                  final chats = controller.chats.value;
                  return CustomScrollView(
                    slivers: [
                      SliverList.builder(
                        itemCount: chats.length,
                        itemBuilder: (context, index) =>
                            ChatCard(chat: chats[index]),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
