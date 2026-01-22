import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_scaffold.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_icons.dart';
import 'package:digital_card_grader/core/features/auth/controllers/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/common_textfield.dart';
import '../../../constants/app_strings.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: commonAppBar(
        title: "Change Password",
        centerTitle: true,
        style: TextStyle(fontSize: 18),
      ),
      body: SafeArea(
        child: Form(
          key: controller.changePasswordFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Obx(() {
                    final hideOldPassword = controller.hideOldPassword.value;
                    return CommonTextfield(
                      "Old password",
                      showTitle: false,
                      prefix: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(AppIcons.key, height: 24, width: 24),
                      ),
                      suffix: IconButton(
                        visualDensity: VisualDensity.comfortable,
                        icon: hideOldPassword
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility_outlined),
                        onPressed: controller.hideOldPassword.toggle,
                      ),
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.textGrey,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      obsecure: hideOldPassword,
                      controller: controller.oldPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.accent),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                      // validator: (value) {
                      //   final input = value!.trim();
                      //   if (input.isEmpty) {
                      //     return AppStrings.enterOldPassword;
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    );
                  }),
                  Obx(() {
                    final hidePassword = controller.hidePassword.value;
                    return CommonTextfield(
                      "New password",
                      showTitle: false,
                      prefix: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(AppIcons.key, height: 24, width: 24),
                      ),
                      suffix: IconButton(
                        visualDensity: VisualDensity.comfortable,
                        icon: hidePassword
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility_outlined),
                        onPressed: controller.hidePassword.toggle,
                      ),
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.textGrey,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.accent),
                      ),
                      obsecure: hidePassword,
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                      // validator: (value) {
                      //   final input = value!.trim();
                      //   if (input.isEmpty) {
                      //     return AppStrings.enterPassword;
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    );
                  }),
                  Obx(() {
                    final hideConfirmPassword =
                        controller.hideConfirmPassword.value;
                    return CommonTextfield(
                      "Confirm password",
                      showTitle: false,
                      prefix: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(AppIcons.key, height: 24, width: 24),
                      ),
                      suffix: IconButton(
                        visualDensity: VisualDensity.comfortable,
                        icon: hideConfirmPassword
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility_outlined),
                        onPressed: controller.hideConfirmPassword.toggle,
                      ),
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.textGrey,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: AppColors.accent),
                      ),
                      obsecure: hideConfirmPassword,
                      controller: controller.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                      // validator: (value) {
                      //   final input = value!.trim();
                      //   if (input.isEmpty) {
                      //     return AppStrings.enterConfirmPassword;
                      //   } else if (controller.passwordController.text.trim() !=
                      //       input) {
                      //     return AppStrings.passwordDoesnotMatched;
                      //   } else {
                      //     return null;
                      //   }
                      // },
                    );
                  }),
                  SizedBox(height: 30),
                  CommonButton(
                    title: "Save",
                    width: 190,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () async{
                      controller.validationAddFeed();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
