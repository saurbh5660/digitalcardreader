import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/enums/card_type_enum.dart';
import 'package:digital_card_grader/core/features/card/controllers/add_card_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/common_dropdown.dart';
import '../../auth/widgets/auth_header.dart';

class AddCardDetailScreen extends GetView<AddCardDetailController> {
  const AddCardDetailScreen({super.key});

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
                  key: controller.addCardFormKey,
                  child: Column(
                    children: [
                      Text(
                        AppStrings.enterCardDetail.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.swatch,
                        ),
                      ),
                      SizedBox(height: 20),
                      CommonTextfield(
                        AppStrings.cardName,
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
                        // validator: (value) {
                        //   final input = value!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.enterCardName;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      CommonDropdrown(
                        hint: AppStrings.cardType,
                        showTitle: true,
                        controller: controller.typeController,
                        options: CardTypeEnum.values,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.crimsonText().fontFamily,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.textGrey,
                          fontFamily: GoogleFonts.crimsonText().fontFamily,
                        ),
                        titleBuilder: (option) =>
                            option.name.capitalize.toString(),
                        onSelected: (option) {
                          controller.selectedCardType = option;
                        },
                        // validator: (input) {
                        //   input = input!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.selectCardType;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      CommonTextfield(
                        AppStrings.additionalNotes,
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.crimsonText().fontFamily,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.textGrey,
                          fontFamily: GoogleFonts.crimsonText().fontFamily,
                        ),
                        controller: controller.additionalNoteController,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [],
                        // validator: (value) {
                        //   final input = value!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.enterAdditionalNotes;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      CommonButton(
                        title: AppStrings.startAiScan,
                        // onPressed: controller.onAiScan,
                        onPressed: controller.scanCard,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
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
