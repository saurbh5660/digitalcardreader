import 'dart:io';

import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:digital_card_grader/core/features/profile/controllers/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../generated/assets.dart';
import '../../../common/common_textfield.dart';
import '../../../constants/app_strings.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "",
        child: ListTile(
          title: Text(
            "Edit Profile",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
        actions: [Padding(padding: const EdgeInsets.symmetric(horizontal: 35))],
      ),
      body: SafeArea(
        child: Form(
          key: controller.editProfileFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.textGrey.withAlpha(50),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.textGrey.withAlpha(100),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: controller.selectProfile,
                        child: ClipOval(
                          child: Obx(() {
                            return controller.profileImages.value == null
                                ? Image.asset(
                                    Assets.imagesImagePlaceholder,
                                    height: 180,
                                    width: 180,
                                    fit: BoxFit.cover,
                                  )
                                : controller.profileImages.value!.startsWith(
                                    'http',
                                  )
                                ? Image.network(
                                    controller.profileImages.value!,
                                    fit: BoxFit.cover,
                                    height: 180,
                                    width: 180,
                                  )
                                : Image.file(
                                    File(controller.profileImages.value!),
                                    fit: BoxFit.cover,
                                    height: 180,
                                    width: 180,
                                  );
                          }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  CommonTextfield(
                    AppStrings.name,
                    controller: controller.nameController,
                    inputFormatters: [],
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.crimsonText().fontFamily,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors.textGrey,
                      fontFamily: GoogleFonts.crimsonText().fontFamily,
                    ),
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: AppColors.accent),
                    ),
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
                    AppStrings.bio,
                    maxLines: 5,
                    controller: controller.bioController,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.crimsonText().fontFamily,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors.textGrey,
                      fontFamily: GoogleFonts.crimsonText().fontFamily,
                    ),
                    inputFormatters: [],
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: AppColors.accent),
                    ),
                    // validator: (value) {
                    //   final input = value!.trim();
                    //   if (input.isEmpty) {
                    //     return AppStrings.enterBio;
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  SizedBox(height: 30),
                  CommonButton(
                    title: "Save",
                    onPressed: () async {
                      controller.validationUpdate();
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
