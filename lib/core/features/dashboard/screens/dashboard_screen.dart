import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_icons.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/features/browse/screens/browse_screen.dart';
import 'package:digital_card_grader/core/features/card/screens/add_card_detail_screen.dart';
import 'package:digital_card_grader/core/features/chat/screens/chat_screen.dart';
import 'package:digital_card_grader/core/features/dashboard/controllers/dashboard_controller.dart';
import 'package:digital_card_grader/core/features/dashboard/widgets/app_navigation_bar.dart';
import 'package:digital_card_grader/core/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => [
          HomeScreen(),
          BrowseScreen(),
          AddCardDetailScreen(),
          ChatScreen(),
        ][controller.currentIndex.value],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: OvalBorder(),
        onPressed: () {
          controller.onChangeIndex(0);
          Get.toNamed(AppRoutes.addCardDetail);
        },
        backgroundColor: AppColors.accent,
        child: Image.asset(AppIcons.battery, height: 32, width: 32),
      ),
      bottomNavigationBar: AppNavigationBar(),
    );
  }
}
