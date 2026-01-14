import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/features/profile/controllers/profile_controller.dart';
import 'package:digital_card_grader/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../profile/controllers/inventory_controller.dart';

class InventoryScreen extends GetView<InventoryController> {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "",
        child: Center(
          child: Text(
            "Inventory",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Limited Borders"),
              const SizedBox(height: 15),

              /// Horizontal Limited Border List
              SizedBox(
                height: 150, // Adjusted height for the border asset
                // child: Obx(() {
                  // final borders = controller.profile.value.packBuyList ?? [];
                  // if (borders.isEmpty) {
                  //   return _buildEmptyState("No Limited Borders Available");
                  // }
                   child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Image.asset(
                          Assets.imagesGoldLimitedBorder,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  )
                // }),
              ),

              const SizedBox(height: 30),
              _buildSectionTitle("My Collection"),
           /*   const SizedBox(height: 15),

              /// Simple Grid showing only the border/card image
              Obx(() {
                final items = controller.cardList;
                if (items.isEmpty) {
                  return const Center(child: Text("Collection is empty"));
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    // This grid also remains focused purely on the visual asset
                    return Image.asset(
                      Assets.imagesGoldLimitedBorder,
                      fit: BoxFit.fill,
                    );
                  },
                );
              }),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.textGrey.withAlpha(30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(message, style: TextStyle(color: AppColors.textGrey)),
      ),
    );
  }
}
