import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_scaffold.dart';
import 'package:digital_card_grader/core/features/contact/controllers/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/common_textfield.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/app_utils.dart';

class ContactScreen extends GetView<ContactController> {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: commonAppBar(
        title: "",
        child: ListTile(
          title: Text(
            "Contact Us",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: [Padding(padding: const EdgeInsets.symmetric(horizontal: 35))],
      ),
      body: SafeArea(
        child: Form(
          key: controller.contactFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  CommonTextfield(
                    AppStrings.name,
                    showTitle: false,
                    controller: controller.nameController,
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.accent),
                    ),
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
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
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [],
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

                  CommonTextfield(
                    AppStrings.message,
                    maxLines: 5,
                    showTitle: false,
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    controller: controller.messageController,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [],
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.accent),
                    ),
                    // validator: (value) {
                    //   final input = value!.trim();
                    //   if (input.isEmpty) {
                    //     return AppStrings.enterMessage;
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  SizedBox(height: 20),
                  CommonButton(
                    title: "Submit",
                    width: 190,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    onPressed: controller.onContactUs,
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
