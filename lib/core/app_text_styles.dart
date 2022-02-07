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

  static final TextStyle buttonWhite = GoogleFonts.lato(
    fontSize: 17,
    fontWeight: FontWeight.w900,
    color: AppColors.white,
  );

  static final TextStyle selectedTabText = GoogleFonts.lato(
    color: AppColors.selectedTitle,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle productCounter = GoogleFonts.ubuntu(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle cartCounter = GoogleFonts.ubuntu(
    color: AppColors.white,
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle titleProductDetails = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle titleSettings = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 22,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle nameCharacteristics = GoogleFonts.lato(
    color: AppColors.greyDarkText,
    fontSize: 16,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle characteristic = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle priceProduct = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle textLoading = GoogleFonts.lato(
    color: AppColors.black,
    fontSize: 12,
    fontWeight: FontWeight.w900,
  );
}
