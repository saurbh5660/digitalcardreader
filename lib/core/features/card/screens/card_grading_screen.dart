import 'dart:io';

import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/card/controllers/card_grading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../network/api_constants.dart';

class CardGradingScreen extends GetView<CardGradingController> {
  const CardGradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "Your Card Grade",

        actions: [Padding(padding: const EdgeInsets.symmetric(horizontal: 35))],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textGrey.withAlpha(50),
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Builder(
                builder: (_) {
                  final card = controller.card.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Image.network(
                              '${ApiConstants.userImageUrl}${card?.savedPath ?? ''}',
                              width: MediaQuery.of(context).size.width * 0.6,
                              errorBuilder: (context, error, stackTrace) {
                                return SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  card?.rawLabels?.firstOrNull?.name ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  card?.grade ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.swatch,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "${card?.scores?.overall ?? 0.0}",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "AI Grading Results",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),

                      Text(
                        'Centering : ${card?.scores?.centering ?? ''}',
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),

                      Text(
                        'Edges : ${card?.scores?.edges ?? ''}',
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Corners : ${card?.scores?.corners ?? ''}",
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Surface : ${card?.scores?.surface ?? ''}",
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Overall Grade : ${card?.scores?.overall ?? ''}",
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Additional Details ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "The card is in great shape. Kept stored away and well taken care of.",
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 20),
                      CommonButton(
                        title: "Continue",
                        onPressed: controller.onContinue,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
