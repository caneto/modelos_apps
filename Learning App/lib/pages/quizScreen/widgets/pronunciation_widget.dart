// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/Dialogs/correctanswerdialog.dart';
import 'package:learnkuy/general_widgets/Dialogs/incorrectdialog.dart';
import 'package:learnkuy/general_widgets/customtrack_shape.dart';
import 'package:learnkuy/models/question_models/pronunciation_model.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class PronunciationWidget extends StatefulWidget {
  final Pronunciation pronunciation;
  PageController pageController;
  final int itemCount;
  PronunciationWidget({
    Key? key,
    required this.itemCount,
    required this.pageController,
    required this.pronunciation,
  }) : super(key: key);

  @override
  State<PronunciationWidget> createState() => _PronunciationWidgetState();
}

class _PronunciationWidgetState extends State<PronunciationWidget> {
  final AppTextStyle appTextStyle = AppTextStyle();
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h)
          .copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                // '${countries.percentage.toString().split('.')[0].toString()}%',
                'Progress: 30/100',
                style: appTextStyle.kBExtraSmallMedium.copyWith(
                    color: AppColor.kGrayscale40,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 20.h,
              trackShape: CustomTrackShape(),
            ),
            child: Slider(
              activeColor: AppColor.kPrimary.withOpacity(0.3),
              thumbColor: AppColor.kPrimary,
              inactiveColor: AppColor.kLine,
              min: 0.0,
              max: 1.0,
              // value: 0 +
              //     double.parse(
              //       '.' + countries.percentage.toString().split('.')[0],
              value: 0.3,

              onChanged: (val) {},
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            color: AppColor.kWhite,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 34.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.pronunciation.words.toString(),
                          style: appTextStyle.kH4SemiBoldTextstyle.copyWith(
                              color: AppColor.kGrayscaleDark100,
                              fontWeight: FontWeight.w600,
                              fontSize: 24.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          widget.pronunciation.wordType.toString(),
                          style: appTextStyle.kBMediumMedium.copyWith(
                              color: AppColor.kGrayscale40,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    widget.pronunciation.wordDescription.toString(),
                    style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscale40,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Synonyms',
                    style: appTextStyle.kBMediumSemiBold.copyWith(
                        color: AppColor.kGrayscaleDark100,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Wrap(
                    children: List.generate(
                        widget.pronunciation.synonymsList.length, (index) {
                      String currentItem =
                          widget.pronunciation.synonymsList[index];
                      return InkWell(
                        onTap: () {
                          setState(
                            () {
                              selectIndex = index;
                              widget.pronunciation.userAnswer = currentItem;
                              if (widget.pronunciation.userAnswer ==
                                  widget.pronunciation.answer) {
                                Get.dialog(
                                  CorrectAnswerDialog(
                                    appTextStyle: appTextStyle,
                                    pageController: widget.pageController,
                                    onTap: () {
                                      Get.back<void>();
                                      widget.pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                  ),
                                );
                              } else {
                                Get.dialog(
                                  IncorrectDialog(
                                    appTextStyle: appTextStyle,
                                    correctAnswer: widget.pronunciation.answer,
                                  ),
                                );
                              }
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 26.w, vertical: 8.h),
                            decoration: BoxDecoration(
                                color: AppColor.kWhite,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                    color: selectIndex == index
                                        ? AppColor.kPrimary
                                        : AppColor.kLine)),
                            child: Text(
                              widget.pronunciation.synonymsList[index],
                              style: appTextStyle.kBSmallSemiBold.copyWith(
                                  color: index == selectIndex
                                      ? AppColor.kPrimary
                                      : AppColor.kGrayscaleDark100,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
