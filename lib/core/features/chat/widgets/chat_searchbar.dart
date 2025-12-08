import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/common_textfield.dart';
import '../../../constants/app_icons.dart';

class ChatSearchbar extends GetView<ChatController> {
  const ChatSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return
      CommonTextfield(
      "Search Here..",
      showTitle: false,
      borderSide: BorderSide(width: 1, color: AppColors.textGrey.withAlpha(80)),
      fillColor: AppColors.white,
      hintStyle: TextStyle(
        fontSize: 14,

        color: AppColors.textGrey.withAlpha(100),
      ),
      isDense: true,
      prefix: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10, top: 4, bottom: 4),
        child: ImageIcon(AssetImage(AppIcons.search), color: AppColors.accent),
      ),
      suffix: Icon(Icons.mic, color: AppColors.textGrey, size: 25),
    );
  }
}
