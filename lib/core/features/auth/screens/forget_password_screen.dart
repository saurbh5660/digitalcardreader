import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/features/auth/controllers/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../widgets/auth_header.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

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
                  child: Column(
                    children: [
                      Text(
                        AppStrings.typeYourEmail.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.swatch,
                          fontFamily: GoogleFonts.alatsi().fontFamily,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          AppStrings.weWillSendInstruction,
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
                      CommonTextfield(
                        AppStrings.email,
                        showTitle: false,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.abrilFatface().fontFamily,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.textGrey,
                          fontFamily: GoogleFonts.abrilFatface().fontFamily,
                        ),
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [],
                        // validator: (value) {
                        //   final input = value!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.enterEmail;
                        //   } else if (!AppUtils.emailValidation(input)) {
                        //     return AppStrings.enterValidEmail;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),

                      CommonButton(
                        title: "SEND",
                        onPressed: () => controller.validateEmail(),
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
