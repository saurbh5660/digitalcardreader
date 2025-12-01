import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/enums/cms_enum.dart';
import 'package:digital_card_grader/core/utils/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingController extends GetxController {
  final isNotification = RxBool(true);
  final tabs = [
    "Notication",
    "Change Password",
    "Pack",
    "Contact Us",
    "Terms & Conditions",
    "Privacy Policy",
    "Delete Account",
    "Logout",
  ];

  void onPressed(int index) {
    switch (index) {
      case 1:
        Get.toNamed(AppRoutes.changePassword);
      case 2:
        Get.toNamed(AppRoutes.pack);
      case 3:
        Get.toNamed(AppRoutes.contact);
      case 4:
        Get.toNamed(AppRoutes.cms, arguments: CmsEnum.terms);

      case 5:
        Get.toNamed(AppRoutes.cms, arguments: CmsEnum.policy);
      case 6:
        DialogHelper.openDialog(
          Icons.delete,
          "Delete Account",
          "Are you sure want to delete this account?",
          [
            CommonButton(
              title: "Yes",
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              onPressed: () async => Get.offAllNamed(AppRoutes.signin),
            ),
            SizedBox(height: 20),
            CommonButton(
              title: "No",
              borderRadius: BorderRadius.circular(10),

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              foregroundColor: AppColors.swatch,
              backgroundColor: AppColors.white,
              onPressed: () async => Get.back(),
            ),
          ],
        );
      case 7:
        DialogHelper.openDialog(
          FontAwesomeIcons.arrowRightToBracket,
          "Logout",
          "Are you sure want to logout this account?",
          [
            CommonButton(
              title: "Yes",
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              onPressed: () async => Get.offAllNamed(AppRoutes.signin),
            ),
            SizedBox(height: 20),
            CommonButton(
              title: "No",
              borderRadius: BorderRadius.circular(10),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              foregroundColor: AppColors.swatch,
              backgroundColor: AppColors.white,
              onPressed: () async => Get.back(),
            ),
          ],
        );
      // Get.offAllNamed(AppRoutes.signin);
    }
  }
}
