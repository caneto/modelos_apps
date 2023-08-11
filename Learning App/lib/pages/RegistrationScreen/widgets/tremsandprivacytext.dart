import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class TermsAndPrivacyText extends StatelessWidget {
  TermsAndPrivacyText(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3,
      this.color2,
      required this.title4});
  final Color? color2;
  final String title1, title2, title3, title4;
  final AppTextStyle _appTextStyle = AppTextStyle();
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: _appTextStyle.kBMediumMedium.copyWith(
            color: AppColor.kGrayscale40,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp),
        children: [
          TextSpan(
            text: title1,
          ),
          TextSpan(
            text: title2,
            style: _appTextStyle.kBMediumMedium.copyWith(
                color: color2?? AppColor.kGrayscaleDark100,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
          TextSpan(
            text: title3,
            style: _appTextStyle.kBMediumMedium.copyWith(
                color: AppColor.kGrayscale40,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
          TextSpan(
            text: title4,
            style: _appTextStyle.kBMediumMedium.copyWith(
                color: AppColor.kGrayscaleDark100,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
