
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class CreateAccountCard extends StatelessWidget {
  const CreateAccountCard({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 53.w,
      ).copyWith(bottom: 32.h),
      child: SizedBox(
        width: 244.w,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: appTextStyle.kH5SemiBoldTextstyle.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'We happy to see you. Sign Up to your account',
                textAlign: TextAlign.center,
                style: appTextStyle.kBMediumMedium.copyWith(
                    color: AppColor.kGrayscale40,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              )
            ]),
      ),
    );
  }
}