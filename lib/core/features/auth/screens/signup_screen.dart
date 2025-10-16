import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/features/auth/controllers/signup_controller.dart';
import 'package:digital_card_grader/core/utils/app_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/auth_header.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

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
                  key: controller.signupFormKey,
                  child: Column(
                    children: [
                      CommonTextfield(
                        AppStrings.name,
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
                        controller: controller.nameController,
                        inputFormatters: [],
                        // validator: (value) {
                        //   final input = value!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.enterName;
                        //   } else {
                        //     return null;
                        //   }
                        // },
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CommonButton(
                        title: "SIGN UP",
                        onPressed: () => controller.validationSignup(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${AppStrings.alreadyHaveAccount} ",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.abrilFatface().fontFamily,
                                color: AppColors.black,
                              ),
                            ),
                            TextSpan(
                              text: AppStrings.signIn.toUpperCase(),
                              recognizer: TapGestureRecognizer()
                                ..onTap = Get.back,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.abrilFatface().fontFamily,
                                color: AppColors.swatch,
                              ),
                            ),
                          ],
                        ),
                      ),

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
