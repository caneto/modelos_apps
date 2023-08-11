
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class ForgotPasswordCard extends StatelessWidget {
  const ForgotPasswordCard({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 60.w,
      ).copyWith(bottom: 32.h),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Forgot Password',
              textAlign: TextAlign.center,
              style: appTextStyle.kH5SemiBoldTextstyle.copyWith(
                  color: AppColor.kGrayscaleDark100,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Enter your email, we will send  a verification code to email',
              textAlign: TextAlign.center,
              style: appTextStyle.kBMediumMedium.copyWith(
                  color: AppColor.kGrayscale40,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp),
            ),
          ]),
    );
  }
}
