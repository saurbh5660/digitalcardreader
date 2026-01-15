import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../profile/controllers/inventory_controller.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});

  final InventoryController controller =
  Get.put(InventoryController()); // 👈 INITIALIZED HERE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: commonAppBar(
        title: "",
        child: Center(
          child: Text(
            "Inventory",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.openSans().fontFamily,
            ),
          ),
        ),
        actions: const [
          SizedBox(width: 60),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildSectionTitle("Limited Borders"),
            const SizedBox(height: 16),

            /// Inventory Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Obx(() {
                  if (controller.inventoryList.isEmpty) {
                    return _buildEmptyState("No inventory found");
                  }

                  return GridView.builder(
                    itemCount: controller.inventoryList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      return _inventoryItem(
                        "Limited Border",
                      );
                    },
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
          fontFamily: GoogleFonts.openSans().fontFamily,
        ),
      ),
    );
  }

  /// Inventory Card Item
  Widget _inventoryItem(String title) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.textGrey.withOpacity(0.25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Image.asset(
                  Assets.imagesGoldLimitedBorder,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Empty State
  Widget _buildEmptyState(String message) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontFamily: GoogleFonts.openSans().fontFamily,
          ),
        ),
      ),
    );
  }
}
