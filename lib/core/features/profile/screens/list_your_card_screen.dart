import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/enums/card_collection_enum.dart';
import 'package:digital_card_grader/core/features/profile/controllers/list_your_card_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import '../../../common/common_dropdown.dart';
import '../../auth/widgets/auth_header.dart';

class ListYourCardScreen extends GetView<ListYourCardController> {
  const ListYourCardScreen({super.key});

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
                  key: controller.listCardFormKey,
                  child: Column(
                    children: [
                      Text(
                        AppStrings.listYourCard.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.swatch,
                        ),
                      ),
                      SizedBox(height: 20),
                      openDropDown(controller),
                      SizedBox(height: 20),
                      openCardDropDown(controller),
                      CommonTextfield(
                        AppStrings.price,
                        controller: controller.priceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        ],
                        // validator: (value) {
                        //   final input = value!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.enterPrice;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      CommonTextfield(
                        AppStrings.additionalNotes,
                        maxLines: 5,
                        controller: controller.additionalNotesController,
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
                      CommonButton(
                        title: "Submit to Marketplace",
                        onPressed:() async{
                          controller.addToMarketPlace();
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

  Widget openDropDown(ListYourCardController controller) {
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
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                decoration: InputDecoration(
                  hintText: 'Select Collection',
                  hintStyle: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
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

                Logger().d("sgdsgdsgsdgds");
                controller.selectedCollectionId.value = selectedCollection.id ?? "";
                controller.getCardListing();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget openCardDropDown(ListYourCardController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " Choose a card from your collection::",
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
                return controller.cardList
                    .map((category) => category.cardName ?? "")
                    .toList();
              },
              decoratorProps: DropDownDecoratorProps(
                baseStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                decoration: InputDecoration(
                  hintText: 'Select Card',
                  hintStyle: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  border: InputBorder.none,
                ),
              ),
              popupProps: const PopupProps.menu(
                fit: FlexFit.loose,
              ),
              onChanged: (selectedValue) {
                var selectedCollection = controller.cardList.firstWhere(
                      (category) => category.cardName == selectedValue,
                );

                controller.selectedCardId.value = selectedCollection.id ?? "";
              },
            ),
          ),
        ],
      ),
    );
  }
}
