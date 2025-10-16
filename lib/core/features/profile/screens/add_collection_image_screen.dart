import 'dart:io';

import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_icons.dart';
import 'package:digital_card_grader/core/features/profile/controllers/add_collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_strings.dart';
import '../../auth/widgets/auth_header.dart';

class AddCollectionImageScreen extends GetView<AddCollectionController> {
  const AddCollectionImageScreen({super.key});

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
                child: Column(
                  children: [
                    Text(
                      "Add a Collection",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        color: AppColors.swatch,
                      ),
                    ),
                    SizedBox(height: 20),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: GestureDetector(
                        onTap: () => controller.selectCollectionImage(false),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Obx(() {
                              final image = controller.collectionImage.value;
                              if (image != null) {
                                return Image.file(
                                  File(image),
                                  fit: BoxFit.cover,
                                );
                              } else {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppIcons.image,
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(height: 18),
                                    Text(
                                      "Select File",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.textGrey,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            GoogleFonts.urbanist().fontFamily,
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: Divider(endIndent: 10)),
                        Text(
                          "or",

                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: GoogleFonts.urbanist().fontFamily,
                          ),
                        ),
                        Expanded(child: Divider(indent: 10)),
                      ],
                    ),

                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => controller.selectCollectionImage(true),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, color: AppColors.white),
                            SizedBox(width: 10),
                            Text(
                              "Open Camera & Take Photo",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                                fontFamily: GoogleFonts.urbanist().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    CommonButton(
                      title: "Continue",
                      onPressed: controller.onSubmit,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
