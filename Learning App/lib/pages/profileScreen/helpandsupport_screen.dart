import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/simple_appbar.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  TextEditingController searchC = TextEditingController();
  InputBorder enabledBorder = InputBorder.none;
  InputBorder focusedErrorBorder = InputBorder.none;
  InputBorder errorBorder = InputBorder.none;
  InputBorder focusedBorder = InputBorder.none;
  final AppTextStyle appTextStyle = AppTextStyle();
  int selectIndex = 0;
  bool isOff = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar:
          SimpleAppBar(title: 'Help and Support', appTextStyle: appTextStyle),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w)
                .copyWith(top: 16.h, bottom: 32.h),
            child: Container(
              width: 327.w,
              height: 52.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: AppColor.kBackground2,
                  border: Border.all(color: AppColor.kLine)),
              child: TextFormField(
                controller: searchC,
                style: appTextStyle.kBMediumMedium.copyWith(
                  color: AppColor.kGrayscaleDark100,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                  filled: true,
                  hintText: 'Search...',
                  hintStyle: appTextStyle.kBMediumMedium.copyWith(
                    color: AppColor.kGrayscale40,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppIcons.kSearch,
                      width: 12.w,
                      height: 12.h,
                    ),
                  ),
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 32.w,
                        child: VerticalDivider(
                          color: AppColor.kLine,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 14.w),
                        child: SvgPicture.asset(
                          AppIcons.kMicrophone,
                        ),
                      ),
                    ],
                  ),
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                  errorBorder: errorBorder,
                  focusedErrorBorder: focusedErrorBorder,
                ),
                onChanged: (v) {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Card(
              color: AppColor.kBackground2,
              child: ExpansionTile(
                textColor: AppColor.kPrimary,
                iconColor: AppColor.kPrimary,
                collapsedIconColor: AppColor.kGrayscaleDark100,
                collapsedTextColor: AppColor.kGrayscaleDark100,
                title: Text(
                  'How to start learning in the app?',
                  style: appTextStyle.kBMediumSemiBold.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    child: Text(
                      "Checking app notifications typically involves ensuring that you have enabled notifications for the AI learning app on your device. This can usually be done through the app's settings or notification settings on your device.",
                      style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Card(
              color: AppColor.kBackground2,
              child: ExpansionTile(
                textColor: AppColor.kPrimary,
                iconColor: AppColor.kPrimary,
                collapsedIconColor: AppColor.kGrayscaleDark100,
                collapsedTextColor: AppColor.kGrayscaleDark100,
                title: Text(
                  "What are the app's features?",
                  style: appTextStyle.kBMediumSemiBold.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    child: Text(
                      "Checking app notifications typically involves ensuring that you have enabled notifications for the AI learning app on your device. This can usually be done through the app's settings or notification settings on your device.",
                      style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Card(
              color: AppColor.kBackground2,
              child: ExpansionTile(
                textColor: AppColor.kPrimary,
                iconColor: AppColor.kPrimary,
                collapsedIconColor: AppColor.kGrayscaleDark100,
                collapsedTextColor: AppColor.kGrayscaleDark100,
                title: Text(
                  'How to stay updated with new content or updates?',
                  style: appTextStyle.kBMediumSemiBold.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    child: Text(
                      "Checking app notifications typically involves ensuring that you have enabled notifications for the AI learning app on your device. This can usually be done through the app's settings or notification settings on your device.",
                      style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Card(
              color: AppColor.kBackground2,
              child: ExpansionTile(
                textColor: AppColor.kPrimary,
                iconColor: AppColor.kPrimary,
                collapsedIconColor: AppColor.kGrayscaleDark100,
                collapsedTextColor: AppColor.kGrayscaleDark100,
                title: Text(
                  'Can I track my progress?',
                  style: appTextStyle.kBMediumSemiBold.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    child: Text(
                      "Checking app notifications typically involves ensuring that you have enabled notifications for the AI learning app on your device. This can usually be done through the app's settings or notification settings on your device.",
                      style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Card(
              color: AppColor.kBackground2,
              child: ExpansionTile(
                textColor: AppColor.kPrimary,
                iconColor: AppColor.kPrimary,
                collapsedIconColor: AppColor.kGrayscaleDark100,
                collapsedTextColor: AppColor.kGrayscaleDark100,
                title: Text(
                  '1. Can I customize my learning?',
                  style: appTextStyle.kBMediumSemiBold.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    child: Text(
                      "Checking app notifications typically involves ensuring that you have enabled notifications for the AI learning app on your device. This can usually be done through the app's settings or notification settings on your device.",
                      style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ]),
      ),
    );
  }
}
