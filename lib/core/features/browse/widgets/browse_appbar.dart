import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_icons.dart';
import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/features/browse/controllers/browse_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class BrowseAppbar extends GetView<BrowseController> {
  const BrowseAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.isSearching.value
                  ? Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, size: 30),
                          onPressed: () {
                            controller.isSearching.value = false;
                          },
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Search For Cards",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.profile),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage(AppImages.headerCards),
                          ),
                        ),
                      ],
                    ),
              if (!controller.isSearching.value) SizedBox(height: 10),
              Hero(
                tag: "search-bar",
                child: CommonTextfield(
                  "Type",
                  showTitle: false,
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.textGrey.withAlpha(80),
                  ),
                  focusNode: controller.inputFocus,
                  style: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(fontSize: 14, color: AppColors.textGrey),
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 8),
                    child: ImageIcon(AssetImage(AppIcons.search)),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
