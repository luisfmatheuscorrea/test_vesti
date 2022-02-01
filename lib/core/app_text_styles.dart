import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_zummedy/core/app_colors.dart';

class AppTextStyles {
  static final TextStyle zummedyText = GoogleFonts.italiana(
    color: AppColors.blackText,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle unselectedTabText = GoogleFonts.lato(
    color: AppColors.blackText,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle selectedTabText = GoogleFonts.lato(
    color: AppColors.selectedTitle,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle cartCounter = GoogleFonts.ubuntu(
    color: AppColors.white,
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );
}
