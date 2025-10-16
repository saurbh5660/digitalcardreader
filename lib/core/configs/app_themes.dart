import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  const AppThemes._();

  static final custom = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.swatch),
    fontFamily: GoogleFonts.archivo().fontFamily,
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
    ),
    bottomAppBarTheme: BottomAppBarThemeData(
      elevation: 5,
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
    ),
  );
}
