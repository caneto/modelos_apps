import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/passwordtextfield.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/general_widgets/primarytextfield.dart';
import 'package:learnkuy/general_widgets/secondarybutton.dart';
import 'package:learnkuy/pages/RegistrationScreen/forgotpassword_screen.dart';
import 'package:learnkuy/pages/RegistrationScreen/signup_screen.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/custom_richtext.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/divderrow.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/tremsandprivacytext.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/welcomebackcard.dart';
import 'package:learnkuy/pages/landingScreen/landing_screen.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            width: 327.w,
            child: Column(children: [
              WelcomeBackCard(appTextStyle: appTextStyle),
              SizedBox(
                height: 36.h,
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
                    height: 8.h,
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
                height: 16.h,
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
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryTextButton(
                    onPressed: () {
                      Get.to(() => ForgotPasswordScreen());
                    },
                    title: 'Forgot Password?',
                    textStyle: appTextStyle.kBSmallMedium.copyWith(
                        color: AppColor.kPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Column(
                children: [
                  PrimaryButton(
                    elevation: 0,
                    onTap: () {
                      Get.off(() => const LandingScreen());
                    },
                    text: 'LogIn',
                    bgColor: AppColor.kPrimary,
                    borderRadius: 20.r,
                    height: 46.h,
                    width: 327.w,
                    textColor: AppColor.kWhite,
                    fontSize: 14.sp,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: CustomRichText(
                      title: 'Don’t have an account?',
                      subtitle: ' Create here',
                      onTab: () {
                        Get.off(() =>   SignUpScreen());
                      },
                      subtitleTextStyle: appTextStyle.kBMediumMedium.copyWith(
                          color: AppColor.kPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Column(
                  children: [
                    DividerRow(title: 'Or Sign In with'),
                    SizedBox(
                      height: 24.h,
                    ),
                    SecondaryButton(
                        height: 56.h,
                        textColor: AppColor.kGrayscaleDark100,
                        width: 280.w,
                        onTap: () {},
                        borderRadius: 24,
                        bgColor: AppColor.kBackground.withOpacity(0.3),
                        text: 'Continue with Google',
                        icons: ImagesPath.kGoogleIcon),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
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
              SizedBox(
                height: 24.h,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
