import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/card/controllers/card_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../network/api_constants.dart';
import '../../../common/wide_indicator.dart';

class CardDetailScreen extends GetView<CardDetailController> {
  const CardDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Card Detail'),
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
    /*    return Scaffold(
      appBar: AppBar(
        title: Text('Card Detail'),
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
  */ /*    appBar: commonAppBar(
        title: "",
        child: ListTile(
          title: Text(
            "Card Detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
        ),
        actions: [Padding(padding: const EdgeInsets.symmetric(horizontal: 35))],
      ),*/ /*
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
                                "\$${card?.price ?? 0}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.swatch,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Image.asset(
                              card?.user?.profilePicture ?? "",
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
                                  card?.userCard?.cardName ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  card?.user?.name ?? "",
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
                        "Centering : ${card?.userCard?.centering.toString()}",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text(
                        "Edges : ${card?.userCard?.edges.toString()}",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text(
                        "Corners : ${card?.userCard?.corners.toString()}",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text(
                        "Surface : ${card?.userCard?.surface.toString()}",
                        style: TextStyle(color: AppColors.textGrey),
                      ),
                      Text(
                        "Overall Grade : ${card?.userCard?.overall.toString()}",
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
    );*/
  }

  Widget _buildCardView(BuildContext context, {required bool isFront}) {
    return Obx(() {
      final card = controller.card.value;
      /* if (card == null) {
        return Center(child: Text("No data found"));
      }
*/
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
                  isFront
                      ? '${ApiConstants.userImageUrl}${card.userCard?.imagePath ?? ''}'
                      : '${ApiConstants.userImageUrl}${card.userCard?.backImagePath ?? ''}',
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
                          card.userCard?.cardName ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          card.user?.name ?? "",
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
                      isFront
                          ? "${card.userCard?.overall ?? 0.0}"
                          : "${card.userCard?.backOverall ?? 0.0}",
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

              _buildScoreRow(
                "Centering",
                isFront
                    ? card.userCard?.centering
                    : card.userCard?.backCentering,
              ),
              _buildScoreRow(
                "Edges",
                isFront ? card.userCard?.edges : card.userCard?.backEdges,
              ),
              _buildScoreRow(
                "Corners",
                isFront ? card.userCard?.corners : card.userCard?.backCorners,
              ),
              _buildScoreRow(
                "Surface",
                isFront ? card.userCard?.surface : card.userCard?.backSurface,
              ),
              _buildScoreRow(
                "Overall Grade",
                isFront ? card.userCard?.overall : card.userCard?.backOverall,
              ),

              const SizedBox(height: 20),

              /// ------------------- EXTRA DETAILS -------------------
              const Text(
                "Additional Details ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                "The card is in great shape. Kept stored away and well taken care of.",
                style: TextStyle(color: AppColors.textGrey, fontSize: 12),
              ),

              const SizedBox(height: 20),
              CommonButton(
                title: "Message Seller",
                onPressed: controller.onMessageSeller,
              ),
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
