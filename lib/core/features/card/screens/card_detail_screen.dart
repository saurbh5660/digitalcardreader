import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/card/controllers/card_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetailScreen extends GetView<CardDetailController> {
  const CardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "",
        child: ListTile(
          title: Text(
            "Card Detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
        actions: [Padding(padding: const EdgeInsets.symmetric(horizontal: 35))],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 40,
                right: 40,
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
                  final card = controller.card;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "\$${card.price ?? 0}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.swatch,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Image.asset(
                              card.user?.profilePicture ?? "",
                              width: MediaQuery.of(context).size.width * 0.6,
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
                                  card.userCard?.cardName ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  card.user?.name ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
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
                              "${0.0}",
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
                      Text(
                        "Centering : ${card.userCard?.centering.toString()}",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text(
                        "Edges : ${card.userCard?.edges.toString()}",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text(
                        "Corners : ${card.userCard?.corners.toString()}",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text(
                        "Surface : ${card.userCard?.surface.toString()}",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text(
                        "Overall Grade : ${card.userCard?.overall.toString()}",
                        style: TextStyle(color: AppColors.textGrey),
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
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      SizedBox(height: 20),
                      CommonButton(
                        title: "Message Seller",
                        onPressed: controller.onMessageSeller,
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
