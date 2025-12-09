import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/constants/app_icons.dart';
import 'package:digital_card_grader/core/features/chat/widgets/chat_card.dart';
import 'package:digital_card_grader/core/features/chat/widgets/chat_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../common/common_textfield.dart';
import '../../../common/db_helper.dart';
import '../../../common/socket_service.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_routes.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final SocketService socketService = SocketService();
  late String senderId;

  TextEditingController searchController = TextEditingController();
  List<dynamic> allChats = [];
  List<dynamic> filteredChats = [];

  @override
  void initState() {
    super.initState();
    senderId = DbHelper().getUserModel()?.id.toString() ?? "";
    socketService.userConstantList(senderId);

    // Listen to socket updates
    socketService.userConstantChatStream.listen((chats) {
      setState(() {
        allChats = chats;
        filteredChats = chats; // Initially show all
      });
    });

    // Listen to search changes
    searchController.addListener(() {
      filterChats(searchController.text);
    });
  }

  void filterChats(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredChats = allChats;
      });
    } else {
      setState(() {
        filteredChats = allChats.where((chat) {
          final bool isSender = chat['senderId'] == senderId;
          final user = isSender ? chat['receiver'] : chat['sender'];
          final String name = user['name'] ?? '';

          return name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  String formatTime(String time) {
    try {
      DateTime dateTime = DateTime.parse(time).toLocal();
      return DateFormat('hh:mm a').format(dateTime);
    } catch (e) {
      return "";
    }
  }

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
              CommonTextfield(
                controller: searchController,
                "Search Here..",
                showTitle: false,
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.textGrey.withAlpha(80),
                ),
                fillColor: AppColors.white,
                hintStyle: TextStyle(
                  fontSize: 14,

                  color: AppColors.textGrey.withAlpha(100),
                ),
                isDense: true,
                prefix: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 10,
                    top: 4,
                    bottom: 4,
                  ),
                  child: ImageIcon(
                    AssetImage(AppIcons.search),
                    color: AppColors.accent,
                  ),
                ),
                // suffix: Icon(Icons.mic, color: AppColors.textGrey, size: 25),
              ),
              Expanded(
                child: filteredChats.isEmpty
                    ? Center(
                        child: Text(
                          "No conversations found",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          color: Colors.black),
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          SliverList.builder(
                            itemCount: filteredChats.length,
                            itemBuilder: (context, index) {
                              final chat = filteredChats[index];
                              return ChatCard(chat: chat);
                            },
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
