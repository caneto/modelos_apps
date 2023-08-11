
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

import 'successdialog.dart';

class TermsAndConditionsDialog extends StatelessWidget {
  const TermsAndConditionsDialog({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColor.kWhite,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 24.w, vertical: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'I agree to the  ',
                    style: appTextStyle.kBMediumMedium
                        .copyWith(
                            color: AppColor.kGrayscale40,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                  ),
                  TextSpan(
                    text:
                        'Terms of Service and Conditions of Use',
                    style: appTextStyle.kBMediumMedium
                        .copyWith(
                            color: AppColor.kPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                  ),
                  TextSpan(
                    text:
                        ' including consent to electronic communications and I affirm that the information provided is my own.',
                    style: appTextStyle.kBMediumMedium
                        .copyWith(
                            color: AppColor.kGrayscale40,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            PrimaryButton(
              elevation: 0,
              onTap: () {
                Get.dialog(SuccessDialog(
                    appTextStyle: appTextStyle));
              },
              text: 'Agree and Continue',
              bgColor: AppColor.kPrimary,
              borderRadius: 20.r,
              height: 46.h,
              textColor: AppColor.kWhite,
              width: 182.w,
              fontSize: 14.sp,
            ),
            SizedBox(
              height: 24.h,
            ),
            PrimaryTextButton(
                onPressed: () {
                  Get.back<Void>();
                },
                textStyle: appTextStyle.kBSmallMedium
                    .copyWith(
                        color: AppColor.kGrayscaleDark100,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                title: 'Disagree')
          ],
        ),
      ),
    );
  }
}
