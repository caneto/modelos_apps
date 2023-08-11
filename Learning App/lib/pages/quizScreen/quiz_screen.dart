// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/models/question_model.dart';
import 'package:learnkuy/models/quiz_model.dart';
import 'package:learnkuy/pages/quizScreen/quiz_progress_screen.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class QuizScreen extends StatefulWidget {
  final String countryName;
  const QuizScreen({super.key, required this.countryName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizModel? filterList;
  PageController pageController = PageController();
  final AppTextStyle appTextStyle = AppTextStyle();
  @override
  void initState() {
    super.initState();
    filterList = quizList.firstWhere((element) {
      print(
          'element quizName ${element.languageId.toLowerCase()}  ${widget.countryName.toLowerCase()}');

      return element.languageId.toLowerCase() ==
          widget.countryName.toLowerCase();
    });
    questionModel = filterList!.questions.first;
  }

  QuestionModel? questionModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhite),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: Icon(
                Icons.more_vert,
                color: AppColor.kGrayscaleDark100,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        title: Text(
          'Question',
          style: appTextStyle.kBMediumSemiBold.copyWith(
            color: AppColor.kGrayscaleDark100,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back<void>();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhite),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColor.kGrayscaleDark100,
                ),
              ),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: filterList!.questions.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {},
        itemBuilder: (context, index) {
          questionModel = filterList!.questions[index];
          return getWidgetForQuestion(questionModel!, pageController, index);
        },
      ),
    );
  }
}
