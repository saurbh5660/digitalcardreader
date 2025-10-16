import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/features/auth/controllers/set_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../widgets/auth_header.dart';

class SetPasswordScreen extends GetView<SetPasswordController> {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthHeader(),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: controller.setPasswordFormKey,
                  child: Column(
                    children: [
                      Text(
                        AppStrings.setNewPassword.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.alatsi().fontFamily,
                          color: AppColors.swatch,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.container,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          AppStrings.typeYourNewPassword,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: GoogleFonts.nunitoSans().fontFamily,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Obx(() {
                        final hidePassword = controller.hidePassword.value;
                        return CommonTextfield(
                          AppStrings.password,
                          showTitle: false,
                          suffix: IconButton(
                            visualDensity: VisualDensity.comfortable,
                            icon: hidePassword
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined),
                            onPressed: controller.hidePassword.toggle,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.abrilFatface().fontFamily,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.textGrey,
                            fontFamily: GoogleFonts.abrilFatface().fontFamily,
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
                          AppStrings.confirmPassword,
                          showTitle: false,
                          suffix: IconButton(
                            visualDensity: VisualDensity.comfortable,
                            icon: hideConfirmPassword
                                ? Icon(Icons.visibility_off_outlined)
                                : Icon(Icons.visibility_outlined),
                            onPressed: controller.hideConfirmPassword.toggle,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.abrilFatface().fontFamily,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.textGrey,
                            fontFamily: GoogleFonts.abrilFatface().fontFamily,
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
                          //   } else if (controller.passwordController.text
                          //           .trim() !=
                          //       input) {
                          //     return AppStrings.passwordDoesnotMatched;
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        );
                      }),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      CommonButton(
                        title: "SEND",
                        onPressed: controller.onSetPassword,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),

                      Image.asset(AppImages.authGraphic),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ],
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
