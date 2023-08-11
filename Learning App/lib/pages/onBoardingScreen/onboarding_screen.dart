import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/models/onboarding_model.dart';
 
import 'package:learnkuy/pages/RegistrationScreen/signin_screen.dart';
import 'package:learnkuy/pages/onBoardingScreen/widgets/onboarding_card.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController1 = PageController(initialPage: 0);
  final PageController _pageController2 = PageController(initialPage: 0);
  int _currentIndex = 0;
  final AppTextStyle _appTextStyle = AppTextStyle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kOnBoardingColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Container(
            height: 10.h,
            width: 10.w,
            margin: EdgeInsets.all(30.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.kPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            flex: 5,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: onBoardinglist.length,
                physics: const BouncingScrollPhysics(),
                controller: _pageController1 ?? _pageController2,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingCard(
                    onBoardingModel: onBoardinglist[index],
                  );
                }),
          ),
          SizedBox(height: 40.h),
          Center(
            child: DotsIndicator(
              dotsCount: onBoardinglist.length,
              position: _currentIndex,
              decorator: DotsDecorator(
                color: AppColor.kPrimary.withOpacity(0.4),
                size: const Size.square(8.0),
                activeSize: const Size(20.0, 8.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                activeColor: AppColor.kPrimary,
              ),
            ),
          ),
          SizedBox(height: 37.h),
          Expanded(
            flex: 2,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: onBoardinglist.length,
                physics: const BouncingScrollPhysics(),
                controller: _pageController2 ?? _pageController1,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingTextCard(
                    onBoardingModel: onBoardinglist[index],
                  );
                }),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 23.w, bottom: 36.h),
            child: PrimaryButton(
              elevation: 0,
              onTap: () {
                if (_currentIndex == onBoardinglist.length - 1) {
                  Get.off(() => SignInScreen());
                } else {
                  _pageController1.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                  _pageController2.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              text: _currentIndex == onBoardinglist.length - 1
                  ? 'Get Started'
                  : 'Next',
              bgColor: AppColor.kPrimary,
              borderRadius: 20.r,
              height: 46.h,
              width: 327.w,
              textColor: AppColor.kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
