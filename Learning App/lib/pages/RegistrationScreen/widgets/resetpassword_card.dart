
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class ResetPasswordCard extends StatelessWidget {
  const ResetPasswordCard({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ).copyWith(top: 12.h),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Reset Password',
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
              'Your password must be at least 8 characters long and include a combination of letters, numbers',
              textAlign: TextAlign.center,
              style: appTextStyle.kBMediumMedium.copyWith(
                  color: AppColor.kGrayscale40,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp),
            )
          ]),
    );
  }
}
