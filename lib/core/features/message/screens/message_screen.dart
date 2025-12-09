import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/message/controllers/message_controller.dart';
import 'package:digital_card_grader/core/features/message/widgets/message_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../../network/api_constants.dart';
import '../../../common/common_textfield.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final MessageController chatController = Get.put(MessageController());
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _scrollToBottom);
  }

  void _sendMessage() {
    chatController.sendMessage(_messageController.text, 0);
    _messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "",
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 30),
          onPressed: () => Navigator.maybePop(Get.context!),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.only(right: 15),
          leading: Obx(() {
            return ClipRRect(
              borderRadius: BorderRadius.circular(62),
              child: Image.network(
                ApiConstants.userImageUrl+(chatController.receiverImage.value),
                fit: BoxFit.cover,
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    Assets.imagesImagePlaceholder,
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  );
                },
              ),
            );
          }),
          title: Obx(() {
              return Text(
                chatController.receiverName.value,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              );
            }
          ),
          /*subtitle: Row(
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
          ),*/
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                final messages = chatController.messages;
                if (messages.isEmpty) {
                  return const Center(child: Text("No messages yet."));
                }
                Future.delayed(Duration.zero, _scrollToBottom);
                return ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return MessageCard(message: message);
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CommonTextfield(
                "Send Message",
                showTitle: false,
                bottomMargin: 5,
                controller: _messageController,
                suffix: IconButton(
                  onPressed: () {
                    _sendMessage();
                  },
                  icon: Icon(
                    CupertinoIcons.location,
                    color: AppColors.textGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
