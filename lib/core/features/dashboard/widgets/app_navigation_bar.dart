import 'package:digital_card_grader/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../controllers/dashboard_controller.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarItem(index: 0, icon: AppIcons.home, label: "Home"),
          NavBarItem(index: 1, icon: AppIcons.search, label: "Browse"),
          SizedBox(width: 10),
          NavBarItem(index: 2, icon: AppIcons.scan, label: "Scan"),
          NavBarItem(index: 3, icon: AppIcons.chat, label: "Chat"),
        ],
      ),
    );
  }
}

class NavBarItem extends GetView<DashboardController> {
  final int index;
  final String icon;

  final String label;
  const NavBarItem({
    super.key,
    required this.index,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.onChangeIndex(index),
        child: Obx(() {
          final currentIndex = controller.currentIndex.value;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? AppColors.container
                  : AppColors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  color: currentIndex == index
                      ? AppColors.accent
                      : AppColors.black,
                  height: 30,
                  width: 30,
                ),
                SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11.74,
                    color: currentIndex == index
                        ? AppColors.accent
                        : AppColors.textGrey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
