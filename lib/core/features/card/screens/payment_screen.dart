import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/features/card/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: ""),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment options",
                      style: TextStyle(
                        fontSize: 23,
                        color: AppColors.accent,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Card(
                              child: Icon(
                                FontAwesomeIcons.creditCard,
                                size: 35,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Icon(
                                FontAwesomeIcons.paypal,
                                color: AppColors.accent,
                                size: 35,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Icon(FontAwesomeIcons.applePay, size: 50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Obx(() {
                final cards = controller.paymentCards.value;
                return cards.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 20,
                            ),
                            child: Text(
                              "Select Your Card",
                              style: TextStyle(
                                fontSize: 21,
                                color: AppColors.accent,
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.inter().fontFamily,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          CarouselSlider.builder(
                            itemCount: cards.length,

                            options: CarouselOptions(
                              aspectRatio: 16 / 8,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.2,
                            ),
                            itemBuilder: (context, index, realIndex) {
                              final card = cards[index];
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 0),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.red,

                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [AppColors.red, AppColors.accent],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.buildingColumns,
                                          color: AppColors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          card.bank ?? "",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          card.card ?? "Credit",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${card.number ?? 9012123112311212}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.wifi,
                                          color: AppColors.white,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Expiry ${card.expiry ?? ""}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${card.cvv ?? ""}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Spacer(),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          card.name ?? "",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          card.type ?? "",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      )
                    : SizedBox();
              }),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "AI Card Grading",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.accent,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.inter().fontFamily,
                            ),
                          ),
                        ),
                        Text(
                          "\$1",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.accent,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.inter().fontFamily,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    CommonButton(
                      title: "Add New Card",
                      onPressed: () async =>
                          Get.toNamed(AppRoutes.addPaymentCard),
                    ),
                    SizedBox(height: 20),

                    Obx(() {
                      return (controller.paymentCards.value.isNotEmpty)
                          ? CommonButton(
                              title: "Continue",
                              onPressed: controller.scanCard,
                            )
                          : SizedBox();
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
