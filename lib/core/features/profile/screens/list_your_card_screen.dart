import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_strings.dart';
import 'package:digital_card_grader/core/enums/card_collection_enum.dart';
import 'package:digital_card_grader/core/features/profile/controllers/list_your_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
                      CommonDropdrown(
                        showTitle: true,
                        hint: "Choose a card from your collection",
                        controller: controller.selectedCollectionController,
                        options: CardCollectionEnum.values,
                        titleBuilder: (option) =>
                            option.name.capitalize.toString(),

                        onSelected: (option) {
                          controller.selectedCardCollection = option;
                        },
                        // validator: (input) {
                        //   input = input!.trim();
                        //   if (input.isEmpty) {
                        //     return AppStrings.selectCardCollection;
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
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
                        onPressed: controller.onSubmit,
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
