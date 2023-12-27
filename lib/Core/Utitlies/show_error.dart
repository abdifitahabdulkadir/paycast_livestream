import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Core/Constants/colors.dart';

void showSnackBarException(String message, BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.appBarColor,
      content: Text(
        message,
        style: GoogleFonts.roboto(
          fontSize: 30,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
      )));
}
