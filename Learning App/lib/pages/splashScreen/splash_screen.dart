import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/pages/onBoardingScreen/onboarding_screen.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppTextStyle _appTextStyle = AppTextStyle();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.off(() => const OnBoardingScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColor.kPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 109.h, left: 79.w, right: 79.w),
              child: Container(
                padding: EdgeInsets.only(
                    right: 59.w, left: 58.w, top: 60.h, bottom: 57.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.kWhite.withOpacity(0.4),
                    border: Border.all(
                      color: AppColor.kLine,
                      width: 1.w,
                      style: BorderStyle.solid,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColor.kPrimaryLight,
                        AppColor.kWhite,
                        AppColor.kWhite,
                        AppColor.kPrimaryLight,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.kBlack.withOpacity(0.25),
                          blurRadius: 2.r,
                          blurStyle: BlurStyle.outer,
                          offset: Offset(0.w, 4.w))
                    ]),
                width: 217.w,
                height: 217.h,
                child: Image.asset(
                  ImagesPath.kBrainLogo,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.h, left: 22.w, right: 22.5.w),
              child: Text(
                'Pintarin',
                style: _appTextStyle.kH4SplashTextstyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 157.5.w,
                right: 157.5.w,
                top: 200.87.h,
              ),
              child: SizedBox(
                width: 60.w,
                height: 60.w,
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.kWhite.withOpacity(0.10),
                  valueColor: AlwaysStoppedAnimation(
                    AppColor.kWhite,
                  ),
                  strokeWidth: 8.0.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
