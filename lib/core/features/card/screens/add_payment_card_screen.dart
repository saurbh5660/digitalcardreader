import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_icons.dart';
import 'package:digital_card_grader/core/enums/cms_enum.dart';
import 'package:flutter/gestures.dart';
import '../controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../../../constants/app_routes.dart';

class AddPaymentCardScreen extends GetView<PaymentController> {
  const AddPaymentCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "",
        isLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.profile),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(AppImages.headerCards),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: controller.addCardFormKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            children: [
              Center(
                child: Text(
                  "Add New Card",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightSky.withAlpha(50),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),

                      child: Text(
                        "Enter card details",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.accent,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Card name",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.accent,
                              fontFamily: GoogleFonts.inter().fontFamily,
                            ),
                          ),
                          TextFormField(
                            controller: controller.cardNameController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 5),
                              hintText: "",
                              suffixIconConstraints: BoxConstraints(
                                maxHeight: 30,
                                maxWidth: 35,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 10,
                                  right: 15,
                                ),
                                child: Image.asset(AppIcons.mastercard),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.black),
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: GoogleFonts.inter().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Card number",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.accent,
                              fontFamily: GoogleFonts.inter().fontFamily,
                            ),
                          ),
                          TextFormField(
                            controller: controller.cardNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 5),
                              hintText: "",

                              suffixIconConstraints: BoxConstraints(
                                maxHeight: 30,
                                maxWidth: 35,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 10,
                                  right: 15,
                                ),
                                child: Image.asset(AppIcons.mastercard),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.black),
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: GoogleFonts.inter().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: TextFormField(
                                controller: controller.cardExpiryController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 5),
                                  hintText: "Expiry date",

                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.accent,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  suffixIconConstraints: BoxConstraints(
                                    maxHeight: 30,
                                    maxWidth: 35,
                                  ),

                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: TextFormField(
                                controller: controller.cardCvvController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(bottom: 5),
                                  hintText: "CVV",
                                  hintStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.accent,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  suffixIconConstraints: BoxConstraints(
                                    maxHeight: 30,
                                    maxWidth: 35,
                                  ),

                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Obx(() {
                          return Checkbox(
                            activeColor: AppColors.swatch,
                            visualDensity: VisualDensity.compact,

                            value: controller.isTermsAgreed.value,
                            onChanged: (_) => controller.isTermsAgreed.toggle(),
                          );
                        }),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 13,
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.toNamed(
                                      AppRoutes.cms,
                                      arguments: CmsEnum.terms,
                                    ),
                                  text: "Terms and Conditions",
                                  style: TextStyle(
                                    color: AppColors.swatch,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() {
                          return Checkbox(
                            visualDensity: VisualDensity.compact,
                            activeColor: AppColors.swatch,
                            value: controller.saveDetail.value,
                            onChanged: (_) => controller.saveDetail.toggle(),
                          );
                        }),
                        Expanded(
                          child: Text(
                            "Save card details",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),

              SizedBox(height: 20),
              CommonButton(title: "Continue", onPressed: controller.addCard),
            ],
          ),
        ),
      ),
    );
  }
}
