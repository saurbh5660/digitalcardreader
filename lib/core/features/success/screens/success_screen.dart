import 'package:digital_card_grader/core/common/common_button.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const SuccessScreen({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.success,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Image.asset(
              AppImages.success,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "Success!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Spacer(),
            CommonButton(
              title: "Homepage",
              backgroundColor: AppColors.black,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
              ),
              onPressed: () async {
                onPressed();
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          ],
        ),
      ),
    );
  }
}
