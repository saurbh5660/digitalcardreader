import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/message/controllers/message_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class MessageBar extends GetView<MessageController> {
  const MessageBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonTextfield(
        "Send Message",
        showTitle: false,
        bottomMargin: 5,
        // controller: controller.inputController,
        suffix: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.location, color: AppColors.textGrey),
        ),
      ),
    );
  }
}
