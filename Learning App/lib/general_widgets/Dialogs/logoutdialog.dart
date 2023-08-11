import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/pages/RegistrationScreen/signin_screen.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        backgroundColor: AppColor.kWhite,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 32.h)
                          .copyWith(bottom: 0.h),
                  child: Text(
                    'Are you sure want to Log Out?',
                    textAlign: TextAlign.center,
                    style: appTextStyle.kBExtraLargeTextstyle.copyWith(
                        color: AppColor.kGrayscaleDark100,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 34.w,
                  ),
                  child: Text(
                    'You could be late for finishing your goal and miss your favorite lessons.',
                    style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
              SizedBox(
                height: 36.h,
              ),
              PrimaryButton(
                elevation: 0,
                onTap: () {
                  Get.back<void>();
                },
                text: 'Cancel',
                bgColor: AppColor.kPrimary,
                borderRadius: 20.r,
                height: 46.h,
                textColor: AppColor.kWhite,
                width: 152.w,
                fontSize: 14.sp,
              ),
              SizedBox(
                height: 24.h,
              ),
              PrimaryTextButton(
                onPressed: () {
                  Get.off(() => SignInScreen());
                },
                title: 'Log Out',
                textStyle: appTextStyle.kBLargeSemiBold.copyWith(
                    color: AppColor.kError,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
