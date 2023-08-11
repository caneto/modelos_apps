import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnkuy/utils/colors.dart';

class AppTheme {
  //create a light theme with custom colors
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.kBackground,
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
      primaryColor: AppColor.kPrimary,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white.withOpacity(0),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: MaterialStateProperty.all(
          6.w,
        ),
        radius: Radius.circular(28.r),
        thumbVisibility: MaterialStateProperty.all(true),
        trackVisibility: MaterialStateProperty.all(true),
        thumbColor: MaterialStateProperty.all(
            AppColor.kPrimary), // Set the color of the scrollbar thumb
        trackColor: MaterialStateProperty.all(AppColor.kGrayscale40),
      ));

  //create a dark theme with custom colors
  static ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor: AppColor.kBackground,
      brightness: Brightness.dark,
      primaryColor: AppColor.kPrimary,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black.withOpacity(0),
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith());
}
