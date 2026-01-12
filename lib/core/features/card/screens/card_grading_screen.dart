import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/card/controllers/card_grading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../network/api_constants.dart';
import '../../../common/wide_indicator.dart';

class CardGradingScreen extends GetView<CardGradingController> {
  const CardGradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Card Grade'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 22,
          leadingWidth: 75,
          actions: [Padding(padding: EdgeInsets.symmetric(horizontal: 35))],
          leading: IconButton(
            icon: const Icon(Icons.arrow_circle_left_rounded, size: 30),
            onPressed: () => Navigator.maybePop(Get.context!),
          ),
          bottom: TabBar(
            indicator: WideIndicator(),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            // indicatorColor: Colors.blue,
            indicatorWeight: 0,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelStyle: TextStyle(
              fontSize: 20, // BIG text
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 18, // slightly smaller
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(text: "Front"),
              Tab(text: "Back"),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TabBarView(
              children: [
                _buildCardView(context, isFront: true),
                _buildCardView(context, isFront: false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ---------------------------------------------------------------
  ///   FRONT / BACK UI BUILDER
  /// ---------------------------------------------------------------
  Widget _buildCardView(BuildContext context, {required bool isFront}) {
    return Obx(() {
      final card = isFront
          ? controller.frontCardData.value
          : controller.backCardData.value;

      if (card == null) {
        return Center(child: Text("No data found"));
      }

      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ------------------- CARD IMAGE -------------------
              Center(
                child: Image.network(
                  '${ApiConstants.userImageUrl}${card.savedPath ?? ''}',
                  width: MediaQuery.of(context).size.width * 0.6,
                  errorBuilder: (_, __, ___) => const SizedBox(),
                ),
              ),

              const SizedBox(height: 20),

              /// ------------------- TITLE & GRADE -------------------
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          card.rawLabels?.firstOrNull?.name ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          card.grade ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),

                  /// ------------------- OVERALL SCORE -------------------
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.swatch,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "${card.scores?.overall ?? 0.0}",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// ------------------- GRADING RESULTS -------------------
              const Text(
                "AI Grading Results",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              _buildScoreRow("Centering", card.scores?.centering),
              _buildScoreRow("Edges", card.scores?.edges),
              _buildScoreRow("Corners", card.scores?.corners),
              _buildScoreRow("Surface", card.scores?.surface),
              _buildScoreRow("Overall Grade", card.scores?.overall),

              const SizedBox(height: 20),

              /// ------------------- EXTRA DETAILS -------------------
              const Text(
                "Additional Details ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                controller.addCardController.additionalNoteController.text.toString(),
                style: TextStyle(color: AppColors.textGrey, fontSize: 12),
              ),

              const SizedBox(height: 20),
              CommonButton(title: "Continue", onPressed: controller.onContinue),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildScoreRow(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        "$title : ${value ?? ''}",
        style: TextStyle(color: AppColors.textGrey, fontSize: 12),
      ),
    );
  }
}
