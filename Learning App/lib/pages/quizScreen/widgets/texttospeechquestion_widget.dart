// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/customtrack_shape.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/models/question_models/text_to_speech.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';

import '../quiz_progress_screen.dart';

class TextToSpeechQuestionWidget extends StatefulWidget {
  final TextToSpeechQuestion question;
  final int itemCount;
  PageController pageController;
  TextToSpeechQuestionWidget({
    Key? key,
    required this.itemCount,
    required this.question,
    required this.pageController,
  }) : super(key: key);

  @override
  State<TextToSpeechQuestionWidget> createState() =>
      _TextToSpeechQuestionWidgetState();
}

class _TextToSpeechQuestionWidgetState
    extends State<TextToSpeechQuestionWidget> {
  final AppTextStyle appTextStyle = AppTextStyle();

  bool isSelected = false;
  bool isButtonEnabled = false;
  List<String> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                // '${countries.percentage.toString().split('.')[0].toString()}%',
                'Progress: 60/100',
                style: appTextStyle.kBExtraSmallMedium.copyWith(
                  color: AppColor.kPrimary,
                ),
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
              value: 0.6,

              onChanged: (val) {},
            ),
          ),
          SizedBox(height: 32.h),
          Text(
            'What does the audio say?',
            style: appTextStyle.kBLargeSemiBold
                .copyWith(color: AppColor.kGrayscaleDark100),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Image.asset(
                ImagesPath.kTalking,
                width: 80.w,
                height: 80.h,
              ),
              SizedBox(width: 14.h),
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                    color: AppColor.kWhite,
                    borderRadius: BorderRadius.circular(56.r)),
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: AppColor.kPrimary,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 14.h),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: widget.question.questionList.map<Widget>((String item) {
              isSelected = selectedItems.contains(item);
              return ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  side: BorderSide(
                    color: isSelected ? AppColor.kPrimary : AppColor.kWhite,
                    width: 1.w,
                  ),
                ),
                backgroundColor: AppColor.kWhite,
                selectedColor: AppColor.kPrimary,
                label: Text(item,
                    style: appTextStyle.kBMediumMedium.copyWith(
                      color: isSelected ? AppColor.kWhite : AppColor.kPrimary,
                    )),
                selected: isSelected,
                onSelected: (bool selected) {
                  setState(() {
                    isButtonEnabled = true;
                    if (selected) {
                      selectedItems.add(item);
                    } else {
                      selectedItems.remove(item);
                    }
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: 32.h),
          PrimaryButton(
            elevation: 0,
            onTap: isButtonEnabled
                ? () {
                    // Check if the current question is the last question
                    print('object');
                    if (widget.pageController.page!.toInt() ==
                        widget.itemCount) {
                      Get.to<void>(() => QuizProgressScreen());
                    }
                  }
                : () {
                    print('unselected');
                  },
            text: 'Choose',
            bgColor:
                isButtonEnabled ? AppColor.kPrimary : AppColor.kGrayscale10,
            borderRadius: 20.r,
            height: 46.h,
            textColor:
                isButtonEnabled ? AppColor.kWhite : AppColor.kGrayscale40,
            width: 327.w,
          ),
          SizedBox(height: 16.h),
          Center(
            child: PrimaryTextButton(
              onPressed: () {
                // Check if the current question is the last question
                if (widget.pageController.page!.toInt() == widget.itemCount) {
                  Get.to<void>(() => QuizProgressScreen());
                }
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              title: 'Next Question',
              textStyle: appTextStyle.kBMediumMedium.copyWith(
                color: AppColor.kGrayscaleDark100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
