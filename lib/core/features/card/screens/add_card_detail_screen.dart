import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/enums/card_type_enum.dart';
import 'package:digital_card_grader/core/features/card/controllers/add_card_detail_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/common_dropdown.dart';
import '../../../constants/app_routes.dart';
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
                      openDropDown(controller),
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
                         // onPressed: controller.scanCard,
                        onPressed: () async{
                          controller.cardValidation();
                        },

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

  Widget openDropDown(AddCardDetailController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " Collection:",
            style: TextStyle(
              fontSize: 13,
              fontFamily: GoogleFonts.crimsonText().fontFamily,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 60,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.card, width: 1.5),
            ),
            child: DropdownSearch<String>(
              items: (filter, cont) {
                return controller.collectionList
                    .map((category) => category.cardName ?? "")
                    .toList();
              },
              decoratorProps: DropDownDecoratorProps(
                baseStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                decoration: InputDecoration(
                  hintText: 'Select Collection',
                  hintStyle: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  border: InputBorder.none,
                ),
              ),
              popupProps: const PopupProps.menu(
                fit: FlexFit.loose,
              ),
              onChanged: (selectedValue) {
                var selectedCollection = controller.collectionList.firstWhere(
                      (category) => category.cardName == selectedValue,
                );
                
                controller.selectedCollectionId.value = selectedCollection.id ?? "";
              },
            ),
          ),
        ],
      ),
    );
  }

}
