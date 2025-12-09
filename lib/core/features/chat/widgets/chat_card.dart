import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../generated/assets.dart';
import '../../../../network/api_constants.dart';
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
    final String name = user['name'] ?? '';
    final String profilePicture = user['profilePicture'] ?? "";
    final String lastMessage = chat['lastMessageIds']?['message'] ?? "";
    final String lastMessageTime = chat['updatedAt'] ?? "";
    final int unreadCount = chat['unreadCount'] ?? 0;

    return ListTile(
      contentPadding: EdgeInsets.only(),
      onTap: () => Get.toNamed(AppRoutes.message, arguments: chat),
      leading:  ClipOval(
        child: profilePicture.isNotEmpty
            ? Image.network(
          ApiConstants.userImageUrl +
              profilePicture,
          height: 66,
          width: 66,
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) {
            return Image.asset(
              Assets.imagesImagePlaceholder,
              height: 66,
              width: 66,
              fit: BoxFit.cover,
            );
          },
        )
            : Image.asset(
          Assets.imagesImagePlaceholder,
          height: 66,
          width: 66,
          fit: BoxFit.cover,
        ),
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
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  if (unreadCount > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Badge(
                        label: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(unreadCount.toString(),style: GoogleFonts.poppins(
                            fontSize: 11,
                          ),),
                        ),
                        backgroundColor: AppColors.accent,
                      ),
                    ),

                ],
              ),
            ),
            SizedBox(width: 5),
            Text(
              formatTime(lastMessageTime),
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
        lastMessage,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textGrey,
        ),
      ),
    );
  }

  String formatTime(String time) {
    try {
      DateTime dateTime = DateTime.parse(time).toLocal();
      return DateFormat('hh:mm a').format(dateTime);
    } catch (e) {
      return "";
    }
  }
}
