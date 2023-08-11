import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/pages/RegistrationScreen/signin_screen.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 32.h),
            SizedBox(
              width: 134.w,
              height: 134.h,
              child: Image.asset(ImagesPath.kListComplete),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h)
                  .copyWith(bottom: 8.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Success',
                      textAlign: TextAlign.center,
                      style: appTextStyle.kH5SemiBoldTextstyle.copyWith(
                          color: AppColor.kGrayscaleDark100,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Your password is successfully created',
                      textAlign: TextAlign.center,
                      style: appTextStyle.kBMediumMedium.copyWith(
                          color: AppColor.kGrayscale40,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    )
                  ]),
            ),
            SizedBox(
              height: 8.h,
            ),
            PrimaryButton(
              elevation: 0,
              onTap: () {
                Get.off(() => SignInScreen());
              },
              text: 'Continue',
              bgColor: AppColor.kPrimary,
              borderRadius: 20.r,
              height: 46.h,
              textColor: AppColor.kWhite,
              width: 152.w,
              fontSize: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
