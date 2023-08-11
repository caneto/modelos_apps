import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnkuy/utils/colors.dart';

class AppTextStyle {
  // Heading text style
  TextStyle kH1Textstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(48.sp),
    fontWeight: FontWeight.bold,
    color: AppColor.kWhite,
  );

  TextStyle kH2Textstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(40.sp),
    fontWeight: FontWeight.bold,
  );
  TextStyle kH3Textstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(32.sp),
    fontWeight: FontWeight.bold,
  );

  TextStyle kH4SplashTextstyle = GoogleFonts.denkOne(
    fontSize: ScreenUtil().setSp(24.sp),
    fontWeight: FontWeight.bold,
    color: AppColor.kWhite,
  );
  TextStyle kH4Textstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(24.sp),
    fontWeight: FontWeight.bold,
    color: AppColor.kGrayscaleDark100,
  );
  TextStyle kH5Textstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(20.sp),
    fontWeight: FontWeight.bold,
  );

  TextStyle kH6Textstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(18.sp),
    fontWeight: FontWeight.bold,
  );

  //SemiBold Heading
  TextStyle kH1SemiBoldTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(48.sp),
    fontWeight: FontWeight.w600,
  );

  TextStyle kH2SemiBoldTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(40.sp),
    fontWeight: FontWeight.w600,
  );
  TextStyle kH3SemiBoldTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(32.sp),
    fontWeight: FontWeight.w600,
  );

  TextStyle kH4SemiBoldTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(24.sp),
    fontWeight: FontWeight.w600,
  );
  TextStyle kH5SemiBoldTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(20.sp),
    fontWeight: FontWeight.w600,
  );

  TextStyle kH6SemiBoldTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(18.sp),
    fontWeight: FontWeight.w600,
  );

  // Medium Heading
  TextStyle kH1MediumTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(48.sp),
    fontWeight: FontWeight.w500,
  );

  TextStyle kH2MediumTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(40.sp),
    fontWeight: FontWeight.w500,
  );
  TextStyle kH3MediumTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(32.sp),
    fontWeight: FontWeight.w500,
  );

  TextStyle kH4MediumTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(24.sp),
    fontWeight: FontWeight.w500,
  );
  TextStyle kH5MediumTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(20.sp),
    fontWeight: FontWeight.w500,
  );

  TextStyle kH6MediumTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(18.sp),
    fontWeight: FontWeight.w500,
  );

  // Body text style
  TextStyle kBExtraLargeTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(18.sp),
    fontWeight: FontWeight.bold,
  );

  TextStyle kBLargeTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(16.sp),
    fontWeight: FontWeight.bold,
  );
  TextStyle kBMediumTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(14.sp),
    fontWeight: FontWeight.bold,
  );

  TextStyle kBSmallTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(12.sp),
    fontWeight: FontWeight.bold,
  );
  TextStyle kBExtraSmallTextstyle = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(10.sp),
    fontWeight: FontWeight.bold,
  );

  //SemiBold BodyTextStyle
  TextStyle kBExtraLargeSemiBold = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(18.sp),
    fontWeight: FontWeight.w600,
  );
  TextStyle kBLargeSemiBold = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(16.sp),
    fontWeight: FontWeight.w600,
  );

  TextStyle kBMediumSemiBold = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(14.sp),
    fontWeight: FontWeight.w600,
  );
  TextStyle kBSmallSemiBold = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(12.sp),
    fontWeight: FontWeight.w600,
  );
  TextStyle kBExtraSmallSemiBold = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(10.sp),
    fontWeight: FontWeight.w600,
  );

  // Medium BodyTextStyle
  TextStyle kBExtraLargeMedium = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(18.sp),
    fontWeight: FontWeight.w500,
  );

  TextStyle kBLargeMedium = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(16.sp),
    fontWeight: FontWeight.w500,
  );
  TextStyle kBMediumMedium = GoogleFonts.plusJakartaSans(
      fontSize: ScreenUtil().setSp(14.sp),
      fontWeight: FontWeight.w500,
      color: AppColor.kWhite);

  TextStyle kBSmallMedium = GoogleFonts.plusJakartaSans(
      fontSize: ScreenUtil().setSp(12.sp),
      fontWeight: FontWeight.w500,
      color: AppColor.kPrimary);
  TextStyle kBExtraSmallMedium = GoogleFonts.plusJakartaSans(
    fontSize: ScreenUtil().setSp(10.sp),
    fontWeight: FontWeight.w500,
  );
}
