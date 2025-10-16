import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/message/controllers/message_controller.dart';
import 'package:digital_card_grader/core/features/message/widgets/message_bar.dart';
import 'package:digital_card_grader/core/features/message/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends GetView<MessageController> {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = controller.chat;
    return Scaffold(
      appBar: commonAppBar(
        title: chat.sender ?? "",
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 30),
          onPressed: () => Navigator.maybePop(Get.context!),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.only(right: 15),
          leading: CircleAvatar(backgroundImage: AssetImage(chat.image ?? "")),
          title: Text(
            chat.sender ?? "",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                "Active Now",
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.circle, size: 10, color: AppColors.green),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                final messages = controller.messages.value;
                return ListView.builder(
                  itemCount: messages.length,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemBuilder: (context, index) =>
                      MessageCard(message: messages[index]),
                );
              }),
            ),
            MessageBar(),
          ],
        ),
      ),
    );
  }
}
