
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class WelcomeBackCard extends StatelessWidget {
  const WelcomeBackCard({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 248.w,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hi, Welcome Back! 👋',
              textAlign: TextAlign.center,
              style: appTextStyle.kH5SemiBoldTextstyle.copyWith(
                  color: AppColor.kGrayscaleDark100, fontSize: 20.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'We happy to see you. Sign In to your account',
              textAlign: TextAlign.center,
              style: appTextStyle.kBMediumMedium.copyWith(
                  color: AppColor.kGrayscale40, fontSize: 14.sp),
            )
          ]),
    );
  }
}
