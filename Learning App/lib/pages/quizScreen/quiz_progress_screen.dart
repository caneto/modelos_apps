import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/Dialogs/sharedialog.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/pages/quizScreen/widgets/pronunciation_widget.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';

class QuizProgressScreen extends StatefulWidget {
  QuizProgressScreen({super.key});

  @override
  State<QuizProgressScreen> createState() => _QuizProgressScreenState();
}

class _QuizProgressScreenState extends State<QuizProgressScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();
  final List<bool> _selectedDays = List<bool>.filled(7, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 129.h),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: SizedBox(
                width: 287.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagesPath.kWinner,
                      width: 120.w,
                      height: 120.w,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      '5 Days Straight',
                      style: appTextStyle.kBExtraLargeSemiBold.copyWith(
                        color: AppColor.kGrayscaleDark100,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Your potential is limitless, keep it up!',
                      style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17.w, top: 26.h, right: 31.w),
              child: Card(
                color: AppColor.kWhite,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 22.h)
                          .copyWith(left: 26.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        spacing: 12.0.w,
                        runSpacing: 10.0,
                        children: List<Widget>.generate(
                          7,
                          (int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedDays[index] = !_selectedDays[index];
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    getDayOfWeek(index),
                                    style: appTextStyle.kBSmallMedium.copyWith(
                                      color: AppColor.kGrayscale40,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.0.w,
                                  ),
                                  Container(
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      color: _selectedDays[index]
                                          ? AppColor.kPrimary
                                          : AppColor.kWhite,
                                      border: Border.all(
                                        color: _selectedDays[index]
                                            ? AppColor.kPrimary
                                            : AppColor.kLine,
                                      ),
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    child: Checkbox(
                                        activeColor: AppColor.kPrimary,
                                        value: _selectedDays[index],
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedDays[index] = value!;
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Divider(
                        color: AppColor.kLine,
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Offer step-by-step instructions or demonstrations to guide students through the concept and help them build a solid foundation of knowledge.',
                        style: appTextStyle.kBMediumMedium.copyWith(
                            color: AppColor.kGrayscale40, fontSize: 14.sp),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: PrimaryButton(
                elevation: 0,
                onTap: () {
                  Get.close(2);
                },
                text: 'Continue',
                bgColor: AppColor.kPrimary,
                borderRadius: 20.r,
                height: 46.h,
                textColor: AppColor.kWhite,
                width: 327.w,
              ),
            ),
            SizedBox(height: 16.h),
            PrimaryTextButton(
              onPressed: () {
                Get.dialog(BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: ShareDialog(
                    onTap: () {
                      Get.close(3);
                    },
                  ),
                ));
              },
              title: 'Share',
              textStyle: appTextStyle.kBMediumMedium.copyWith(
                color: AppColor.kGrayscaleDark100,
              ),
            )
          ]),
        ),
      ),
    );
  }

  String getDayOfWeek(int index) {
    switch (index) {
      case 0:
        return 'Mon';
      case 1:
        return 'Tue';
      case 2:
        return 'Wed';
      case 3:
        return 'Thu';
      case 4:
        return 'Fri';
      case 5:
        return 'Sat';
      case 6:
        return 'Sun';
      default:
        return '';
    }
  }
}
