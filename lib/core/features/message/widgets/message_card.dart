import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageCard extends StatelessWidget {
  final MessageModel message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMyMessage = message.senderId == "user_001";
    return Align(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isMyMessage)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(message.senderImage ?? ""),
              ),
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            margin: EdgeInsets.only(bottom: 10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: isMyMessage
                  ? AppColors.accent.withAlpha(25)
                  : AppColors.card,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              message.message ?? "",
              style: TextStyle(
                color: isMyMessage ? AppColors.accent : null,
                fontSize: 16,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
