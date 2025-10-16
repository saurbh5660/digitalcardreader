import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/features/auth/controllers/signin_controller.dart';
import 'package:digital_card_grader/core/features/auth/widgets/auth_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninScreen extends GetView<SigninController> {
  const SigninScreen({super.key});

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
                  key: controller.singinFormKey,
                  child: Column(
                    children: [
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
                        height: MediaQuery.of(context).size.height * 0.012,
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.forgetPassword),
                        child: Text(
                          AppStrings.forgetPassword,
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2,
                            fontFamily: GoogleFonts.abrilFatface().fontFamily,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CommonButton(
                        title: "LOG IN",
                        onPressed: controller.login,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        AppStrings.orLoginBy.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2,
                          fontFamily: GoogleFonts.abrilFatface().fontFamily,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: Icon(
                              FontAwesomeIcons.google,
                              color: AppColors.swatch,
                            ),
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            radius: 25,
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              color: AppColors.swatch,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${AppStrings.dontHaveAccount} ",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.black,

                                fontFamily:
                                    GoogleFonts.abrilFatface().fontFamily,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(AppRoutes.signup),
                              text: AppStrings.signup.toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.swatch,
                                fontFamily:
                                    GoogleFonts.abrilFatface().fontFamily,
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
