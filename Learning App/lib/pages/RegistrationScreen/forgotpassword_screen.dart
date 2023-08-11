// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/pages/RegistrationScreen/resetpassword_screen.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/backcircle_arrowbutton.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/forgotpasswordcard.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  TextEditingController emailC = TextEditingController();
  final AppTextStyle appTextStyle = AppTextStyle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: registerOverlay,
        backgroundColor: Colors.transparent,
        leading: const BackCircleArrowButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 12.h),
        child: SizedBox(
          width: 327.w,
          child: Column(children: [
            ForgotPasswordCard(appTextStyle: appTextStyle),
            SizedBox(
              height: 36.h,
            ),
            Container(
              width: 335.w,
              height: 92.h,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w)
                  .copyWith(left: 16.w, bottom: 8.h),
              decoration: BoxDecoration(
                  color: AppColor.kBackground,
                  borderRadius: BorderRadius.circular(56.r)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.kWhite),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      child: SvgPicture.asset(AppIcons.kEmail),
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: appTextStyle.kBSmallMedium.copyWith(
                          color: AppColor.kGrayscale40,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                    TextFormField(
                      style: appTextStyle.kBMediumMedium.copyWith(
                          color: AppColor.kGrayscaleDark100,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                      decoration: InputDecoration(
                        hintText: 'Khaledmohammed@gmail.com',
                        hintStyle: appTextStyle.kBMediumMedium.copyWith(
                          color: AppColor.kGrayscaleDark100,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            PrimaryButton(
              elevation: 0,
              onTap: () {
                Get.to(() => const ResetPasswordScreen());
              },
              text: 'Continue',
              bgColor: AppColor.kPrimary,
              borderRadius: 20.r,
              height: 46.h,
              width: 327.w,
              textColor: AppColor.kWhite,
            ),
          ]),
        ),
      ),
    );
  }
}
