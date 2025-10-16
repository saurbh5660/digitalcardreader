import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/enums/card_collection_enum.dart';
import 'package:digital_card_grader/core/features/dashboard/controllers/dashboard_controller.dart';
import 'package:digital_card_grader/core/features/profile/controllers/add_collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/common_dropdown.dart';
import '../../auth/widgets/auth_header.dart';

class AddCollectionScreen extends GetView<AddCollectionController> {
  const AddCollectionScreen({super.key});

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
                  key: controller.addCollectionFormKey,
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
                      CommonDropdrown(
                        showTitle: true,
                        hint: AppStrings.collectionType,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.crimsonText().fontFamily,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.textGrey,
                          fontFamily: GoogleFonts.crimsonText().fontFamily,
                        ),
                        controller: controller.selectedCollectionTypeController,
                        options: CardCollectionEnum.values,
                        titleBuilder: (option) =>
                            option.name.capitalize.toString(),

                        onSelected: (option) {
                          controller.selectedCollectionType = option;
                        },
                        // validator: (input) {
                        //   input = input!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.selectCollectionType;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),

                      CommonTextfield(
                        AppStrings.collectionName,
                        controller: controller.collectionName,
                        textInputAction: TextInputAction.done,
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
                        // validator: (value) {
                        //   final input = value!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.enterCollectionName;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      CommonButton(
                        title: "Add Collection Image",
                        onPressed: () async =>
                            Get.toNamed(AppRoutes.addCollectionImage),
                      ),
                      SizedBox(height: 20),
                      CommonButton(
                        title: "Submit to Marketplace",
                        onPressed: () async {
                          Get.toNamed(
                            AppRoutes.success,
                            arguments: {
                              "title":
                                  "Your Collection Addition was successful",
                              "onPressed": () {
                                Get.until(
                                  (route) =>
                                      Get.currentRoute == AppRoutes.dashboard,
                                );
                                Get.find<DashboardController>().onChangeIndex(
                                  0,
                                );
                              },
                            },
                          );
                        },
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
