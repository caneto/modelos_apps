// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/passwordtextfield.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextfield.dart';
import 'package:learnkuy/general_widgets/secondarybutton.dart';
import 'package:learnkuy/pages/RegistrationScreen/enablelocation_screen.dart';
import 'package:learnkuy/pages/RegistrationScreen/signin_screen.dart';
import 'package:learnkuy/pages/RegistrationScreen/verifycode_screen.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/createaccountcard.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/custom_richtext.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/divderrow.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/nameinputfields.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/tremsandprivacytext.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController firstName = TextEditingController();
  TextEditingController listName = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  final AppTextStyle appTextStyle = AppTextStyle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        systemOverlayStyle: registerOverlay,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            width: 327.w,
            child: Column(children: [
              CreateAccountCard(appTextStyle: appTextStyle),
              NameInputFields(
                  appTextStyle: appTextStyle,
                  firstName: firstName,
                  listName: listName),
              SizedBox(
                height: 15.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscaleDark100,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  PrimaryTextFormField(
                      borderRadius: BorderRadius.circular(24.r),
                      hintText: 'Khaledmohammed@gmail.com',
                      controller: emailC,
                      width: 327.w,
                      height: 52.h)
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscaleDark100,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  PasswordTextField(
                      borderRadius: BorderRadius.circular(24.r),
                      hintText: 'Password',
                      controller: passwordC,
                      width: 327.w,
                      height: 52.h)
                ],
              ),
              SizedBox(
                height: 28.h,
              ),
              Column(
                children: [
                  PrimaryButton(
                    elevation: 0,
                    onTap: () {
                      Get.to(() => const EnableLocationScreen());
                    },
                    text: 'Create Account',
                    bgColor: AppColor.kPrimary,
                    borderRadius: 20.r,
                    height: 46.h,
                    width: 327.w,
                    textColor: AppColor.kWhite,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomRichText(
                    title: 'Already have an account? ',
                    subtitle: 'Log In',
                    onTab: () {
                      Get.off(() => SignInScreen());
                    },
                    subtitleTextStyle: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscaleDark100,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: DividerRow(title: 'Or Sign Up with'),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SecondaryButton(
                        height: 56.h,
                        textColor: AppColor.kGrayscaleDark100,
                        width: 260.w,
                        onTap: () {},
                        borderRadius: 24,
                        bgColor: AppColor.kBackground.withOpacity(0.3),
                        text: 'Continue with Google',
                        icons: ImagesPath.kGoogleIcon),
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: TermsAndPrivacyText(
                  title1: '  By signing up you agree to our',
                  title2: ' Terms ',
                  title3: '  and',
                  title4: ' Conditions of Use',
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
