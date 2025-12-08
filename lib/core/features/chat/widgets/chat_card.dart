import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/db_helper.dart';

class ChatCard extends StatelessWidget {
  final dynamic chat;
  const ChatCard({super.key, required this.chat});


  @override
  Widget build(BuildContext context) {
    final senderId = DbHelper().getUserModel()?.id.toString() ?? "";
    final bool isSender = chat['senderId'] == senderId;
    final user =
    isSender ? chat['receiver'] : chat['sender'];
    final String name =
    "${user['firstName'] ?? ''} ${user['lastName'] ?? ''}"
        .trim();
    final String profilePicture =
        user['profilePicture'] ?? "";
    final String lastMessage =
        chat['lastMessageIds']?['message'] ?? "No messages";
    final String lastMessageTime = chat['updatedAt'] ?? "";
    final int unreadCount = chat['unreadCount'] ?? 0;

    return ListTile(
      contentPadding: EdgeInsets.only(),
      onTap: () => Get.toNamed(AppRoutes.message, arguments: chat),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(chat.image ?? ""),
      ),
      title: ColoredBox(
        color: AppColors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    chat.sender ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  if (chat.time == "10:17 AM")
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Badge(
                        label: Text("2"),
                        backgroundColor: AppColors.accent,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Text(
              chat.time ?? "",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textGrey,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ],
        ),
      ),
      subtitle: Text(
        chat.message ?? "",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textGrey,
        ),
      ),
    );
  }
}
