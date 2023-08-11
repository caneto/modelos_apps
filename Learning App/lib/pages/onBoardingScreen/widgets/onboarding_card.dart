// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/models/onboarding_model.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class OnBoardingCard extends StatefulWidget {
  OnBoarding onBoardingModel;
  OnBoardingCard({
    super.key,
    required this.onBoardingModel,
  });

  @override
  State<OnBoardingCard> createState() => _OnBoardingCardState();
}

class _OnBoardingCardState extends State<OnBoardingCard> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.onBoardingModel.image,
      height: 300.h,
      width: double.maxFinite,
      fit: BoxFit.fitWidth,
    );
  }
}

class OnboardingTextCard extends StatelessWidget {
  final OnBoarding onBoardingModel;
  const OnboardingTextCard({required this.onBoardingModel, super.key});

  @override
  Widget build(BuildContext context) {
    AppTextStyle appTextStyle = AppTextStyle();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        children: [
          Text(
            onBoardingModel.title,
            textAlign: TextAlign.center,
            style: appTextStyle.kH4Textstyle.copyWith(fontSize: 24.sp),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            onBoardingModel.description,
            textAlign: TextAlign.center,
            style: appTextStyle.kBMediumMedium
                .copyWith(color: AppColor.kGrayscale40, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
