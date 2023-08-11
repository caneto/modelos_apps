import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/Dialogs/termsandconditions_dialog.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/backcircle_arrowbutton.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/countdown_widget.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/verifycode_card.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  TextEditingController pinController = TextEditingController();

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
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          width: 330.w,
          child: Column(children: [
            VerifyCodeCard(appTextStyle: appTextStyle),
            Padding(
              padding: EdgeInsets.only(
                left: 47.w,
                right: 32.w,
                top: 44.h,
              ),
              child: PinCodeTextField(
                controller: pinController,
                enablePinAutofill: true,
                hintCharacter: '•',
                obscureText: true,
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                hintStyle: appTextStyle.kH4MediumTextstyle
                    .copyWith(color: AppColor.kGrayscaleDark100),
                textStyle: appTextStyle.kH4MediumTextstyle
                    .copyWith(color: AppColor.kGrayscaleDark100)
                    .copyWith(fontSize: 14.sp),
                pinTheme: PinTheme(
                  inactiveColor: AppColor.kBackground,
                  fieldHeight: 56.h,
                  fieldWidth: 56.w,
                  disabledColor: AppColor.kBackground,
                  errorBorderColor: AppColor.kBackground,
                  selectedColor: AppColor.kBackground,
                  activeColor: AppColor.kBackground,
                  inactiveFillColor: AppColor.kBackground,
                  selectedFillColor: AppColor.kBackground,
                  activeFillColor: AppColor.kBackground,
                  shape: PinCodeFieldShape.circle,
                ),
                length: 4,
                onChanged: (String value) {},
                appContext: context,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                onCompleted: (val) {
                  if (val.length >= 4) {
                    Get.dialog(BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: TermsAndConditionsDialog(appTextStyle: appTextStyle),
                    ));
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 144.h)
                  .copyWith(bottom: 0),
              child: const Countdown(),
            )
          ]),
        ),
      ),
    );
  }
}
