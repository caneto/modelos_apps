// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/simple_appbar.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class LegalPoliciesScreen extends StatelessWidget {
  LegalPoliciesScreen({super.key});
  final AppTextStyle appTextStyle = AppTextStyle();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar:
          SimpleAppBar(title: 'Legal and Policies', appTextStyle: appTextStyle),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SliderTheme(
              data: SliderThemeData(
                activeTrackColor: AppColor.kPrimary,
                thumbColor: AppColor.kPrimary,
                thumbShape: SliderComponentShape.noThumb,
              ),
              child: Scrollbar(
                thickness: 7,
                thumbVisibility: true,
                interactive: true,
                showTrackOnHover: true,
                trackVisibility: false,
                controller: scrollController,
                radius: Radius.circular(28.r),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 9.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            '1. Terms',
                            style: appTextStyle.kBLargeSemiBold.copyWith(
                              color: AppColor.kGrayscaleDark100,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            termText,
                            style: appTextStyle.kBMediumMedium.copyWith(
                              color: AppColor.kGrayscale40,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            'Changes to the Service and/or Terms:',
                            style: appTextStyle.kBLargeSemiBold.copyWith(
                              color: AppColor.kGrayscaleDark100,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            serviceTermText,
                            style: appTextStyle.kBMediumMedium.copyWith(
                              color: AppColor.kGrayscale40,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            serviceTermText,
                            style: appTextStyle.kBMediumMedium.copyWith(
                              color: AppColor.kGrayscale40,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            serviceTermText,
                            style: appTextStyle.kBMediumMedium.copyWith(
                              color: AppColor.kGrayscale40,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
