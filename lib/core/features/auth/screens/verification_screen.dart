import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/features/auth/controllers/verfication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../widgets/auth_header.dart';


class VerificationScreen extends GetView<VerficationController> {
  const VerificationScreen({super.key});

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
                  key: controller.verificationFormKey,
                  child: Column(
                    children: [
                      Text(
                        AppStrings.verification.toUpperCase(),
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
                          horizontal: 20,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.container,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          AppStrings.aMessageWithVerificationCode,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: GoogleFonts.abrilFatface().fontFamily,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CommonTextfield(
                        "Type verification code",
                        showTitle: false,
                        maxLength: 4,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.abrilFatface().fontFamily,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.textGrey,
                          fontFamily: GoogleFonts.abrilFatface().fontFamily,
                        ),
                        controller: controller.otpController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        // validator: (value) {
                        //   final input = value!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.enterVerificationCode;
                        //   } else if (input.length < 6) {
                        //     return AppStrings.enterCompleteVerificationCode;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        AppStrings.dontReciveTheCode,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: GoogleFonts.abrilFatface().fontFamily,
                          letterSpacing: 2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.resendOtpApi();
                        },
                        child: Text(
                          AppStrings.resend,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: GoogleFonts.abrilFatface().fontFamily,
                            letterSpacing: 2,
                            color: AppColors.swatch,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CommonButton(
                        title: AppStrings.verify.toUpperCase(),
                        onPressed: () => controller.validateOtp(),
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
