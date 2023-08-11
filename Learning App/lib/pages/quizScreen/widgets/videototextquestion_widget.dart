import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/Dialogs/correctanswerdialog.dart';
import 'package:learnkuy/general_widgets/Dialogs/incorrectdialog.dart';
import 'package:learnkuy/general_widgets/customtrack_shape.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/models/question_models/video_to_text.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class VideoToTextQuestionWidget extends StatefulWidget {
  final VideoToTextQuestion question;
  PageController pageController;
  final int itemCount;
  VideoToTextQuestionWidget({
    Key? key,
    required this.itemCount,
    required this.question,
    required this.pageController,
  }) : super(key: key);

  @override
  State<VideoToTextQuestionWidget> createState() =>
      _VideoToTextQuestionWidgetState();
}

class _VideoToTextQuestionWidgetState extends State<VideoToTextQuestionWidget> {
  final AppTextStyle appTextStyle = AppTextStyle();
  int selectedOption = -1;
  VideoPlayerController? _controller;
  CustomVideoPlayerController? _customVideoPlayerController;
  @override
  void initState() {
    super.initState();
    print(widget.question.questionVideoUrl);
    _controller =
        VideoPlayerController.network(widget.question.questionVideoUrl)
          ..initialize().then((_) {
            setState(() {});
          });
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _controller!,
      customVideoPlayerSettings: CustomVideoPlayerSettings(
        controlBarAvailable: true,
        customAspectRatio: _controller!.value.aspectRatio,
        controlBarDecoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(24.r),
        ),
        controlBarPadding: EdgeInsets.zero,
        controlsPadding: EdgeInsets.all(8.h),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h)
          .copyWith(bottom: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
            SizedBox(height: 23.h),
            SizedBox(
              height: 173.h,
              width: 327.w,
              child: _controller!.value.isInitialized
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: CustomVideoPlayer(
                          customVideoPlayerController:
                              _customVideoPlayerController!),
                    )
                  : Center(
                      child: SizedBox(
                        width: 60.w,
                        height: 60.h,
                        child: CircularProgressIndicator(
                          backgroundColor: AppColor.kPrimary,
                          valueColor: AlwaysStoppedAnimation(
                            AppColor.kLine,
                          ),
                          strokeWidth: 8.0.w,
                        ),
                      ),
                    ),
            ),
            SizedBox(height: 24.h),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              color: AppColor.kWhite,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 36.h)
                    .copyWith(bottom: 0),
                child: Column(children: [
                  Text(
                    widget.question.question,
                    style: appTextStyle.kBExtraLargeSemiBold
                        .copyWith(color: AppColor.kGrayscaleDark100),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.h),
                  Wrap(
                    children:
                        List.generate(widget.question.options.length, (index) {
                      String currentItem = widget.question.options[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedOption = index;
                            widget.question.userAnswer = currentItem;
                          });
                        },
                        child: Container(
                          width: 300.w,
                          height: 50.h,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedOption == index
                                  ? AppColor.kPrimary
                                  : AppColor.kLine,
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                            color: selectedOption == index
                                ? AppColor.kPrimary.withOpacity(0.2)
                                : AppColor.kWhite,
                          ),
                          child: Center(
                            child: Text(
                              widget.question.options[index],
                              style: appTextStyle.kBMediumMedium.copyWith(
                                color: selectedOption == index
                                    ? AppColor.kPrimary
                                    : AppColor.kGrayscaleDark100,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 32.h),
            PrimaryButton(
              elevation: 0,
              onTap: selectedOption != -1
                  ? () {
                      if (widget.question.userAnswer ==
                          widget.question.answer) {
                        Get.dialog(
                          CorrectAnswerDialog(
                            appTextStyle: appTextStyle,
                            pageController: widget.pageController,
                            onTap: () {
                              Get.back<void>();
                              widget.pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                          ),
                        );
                      } else {
                        Get.dialog(
                          IncorrectDialog(
                            appTextStyle: appTextStyle,
                            correctAnswer: widget.question.answer,
                          ),
                        );
                      }
                    }
                  : () {},
              text: 'Choose',
              bgColor: selectedOption != -1
                  ? AppColor.kPrimary
                  : AppColor.kGrayscale10,
              borderRadius: 20.r,
              height: 46.h,
              textColor: selectedOption != -1
                  ? AppColor.kWhite
                  : AppColor.kGrayscale40,
              width: 263.w,
            ),
            SizedBox(height: 16.h),
            selectedOption != -1
                ? PrimaryTextButton(
                    onPressed: () {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    title: 'Next Question',
                    textStyle: appTextStyle.kBMediumMedium.copyWith(
                      color: AppColor.kGrayscaleDark100,
                    ),
                  )
                : const SizedBox(),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }
}
