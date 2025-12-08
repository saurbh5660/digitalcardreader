import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/common/common_scaffold.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/setting/controllers/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/db_helper.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: commonAppBar(title: "Settings"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: controller.tabs.indexed
                  .map(
                    (each) => GestureDetector(
                      onTap: () => controller.onPressed(each.$1),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        constraints: BoxConstraints(minHeight: 70),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          border: Border.all(color: AppColors.swatch, width: 2),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.textGrey.withAlpha(80),
                              offset: Offset(0, 10),
                              spreadRadius: 1,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                each.$2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: each.$1 == 6
                                      ? AppColors.red
                                      : AppColors.black,
                                ),
                              ),
                            ),
                            if (each.$1 == 0) Spacer(),
                            if (each.$1 == 0)
                              Obx(() {
                                return Switch(
                                  value: controller.isNotification.value,
                                  activeTrackColor: AppColors.swatch,
                                  inactiveThumbColor: AppColors.swatch,
                                  onChanged: (_) {
                                    controller.isNotification.toggle();
                                   /* if (DbHelper().getUserModel()?. == 1) {
                                      Get.find<SettingController>().notificationStatus(0);
                                    } else {
                                      Get.find<SettingController>().notificationStatus(1);
                                    }*/
                                  }

                                );
                              }),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
