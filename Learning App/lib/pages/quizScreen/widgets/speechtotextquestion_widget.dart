// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnkuy/general_widgets/customtrack_shape.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/models/question_models/speech_to_text.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';
import 'package:path_provider/path_provider.dart';

class SpeechToTextQuestionWidget extends StatefulWidget {
  final SpeechToTextQuestion question;
  PageController pageController;
    final int itemCount;
  SpeechToTextQuestionWidget({
    Key? key,
    required this.itemCount,
    required this.question,
    required this.pageController,
  }) : super(key: key);

  @override
  State<SpeechToTextQuestionWidget> createState() =>
      _SpeechToTextQuestionWidgetState();
}

class _SpeechToTextQuestionWidgetState
    extends State<SpeechToTextQuestionWidget> {
  final AppTextStyle appTextStyle = AppTextStyle();

  RecorderController? recorderController;

  String? path;
  String? musicFile;
  bool isRecording = false;
  bool isRecordingCompleted = false;
  bool isLoading = true;
  Directory? appDirectory;
  @override
  void initState() {
    super.initState();
    _getDir();
    initializesControllers();
  }

  void _getDir() async {
    appDirectory = await getApplicationDocumentsDirectory();
    path = "${appDirectory!.path}/recording.m4a";
    isLoading = false;
    setState(() {});
  }

  void initializesControllers() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
  }

  @override
  void dispose() {
    recorderController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h)
            .copyWith(bottom: 0),
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
              'Speaking Test',
              style: appTextStyle.kBLargeSemiBold
                  .copyWith(color: AppColor.kGrayscaleDark100),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Image.asset(
              ImagesPath.kTalking,
              width: 80.w,
              height: 80.h,
            ),
            SizedBox(height: 14.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
              alignment: Alignment.center,
              width: 327.w,
              decoration: BoxDecoration(
                color: AppColor.kPrimary,
                border: Border.all(color: AppColor.kPrimary),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9.r),
                  topRight: Radius.circular(32.r),
                  bottomLeft: Radius.circular(32.r),
                  bottomRight: Radius.circular(32.r),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.kVolumeUp,
                    width: 23.85.w,
                    height: 23.04.h,
                  ),
                  SizedBox(width: 24.h),
                  Expanded(
                    child: Text(
                      widget.question.question,
                      style: appTextStyle.kBSmallMedium.copyWith(
                        color: AppColor.kWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            isRecordingCompleted
                ? Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
                    alignment: Alignment.center,
                    width: 327.w,
                    decoration: BoxDecoration(
                      color: AppColor.kPurple,
                      border: Border.all(color: AppColor.kPurple),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(9.r),
                          bottomLeft: Radius.circular(32.r),
                          topRight: Radius.circular(32.r),
                          topLeft: Radius.circular(32.r)),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.kVolumeUp,
                          width: 23.85.w,
                          height: 23.04.h,
                        ),
                        SizedBox(width: 24.h),
                        Expanded(
                          child: Text(
                            widget.question.question,
                            style: appTextStyle.kBSmallMedium.copyWith(
                              color: AppColor.kWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                _startOrStopRecording();
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isRecording
                    ? AudioWaveforms(
                        enableGesture: true,
                        size: Size(320.w, 59.h),
                        recorderController: recorderController!,
                        waveStyle: WaveStyle(
                          waveColor: AppColor.kPrimary,
                          extendWaveform: true,
                          showMiddleLine: false,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: AppColor.kWhite,
                          border: Border.all(color: AppColor.kPrimary),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 90.w, vertical: 7.h),
                      )
                    : Container(
                        height: 59.h,
                        alignment: Alignment.center,
                        width: 327.w,
                        decoration: BoxDecoration(
                          color: AppColor.kWhite,
                          border: Border.all(color: AppColor.kLine),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.kVoice,
                              width: 23.85.w,
                              height: 23.04.h,
                            ),
                            SizedBox(width: 11.h),
                            Text(
                              'Tap to talk',
                              style: appTextStyle.kBMediumSemiBold.copyWith(
                                color: AppColor.kGrayscaleDark100,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            SizedBox(height: 32.h),
            PrimaryButton(
              elevation: 0,
              onTap: isRecordingCompleted
                  ? () {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }
                  : () {},
              text: 'Check',
              bgColor: isRecordingCompleted
                  ? AppColor.kPrimary
                  : AppColor.kGrayscale10,
              borderRadius: 20.r,
              height: 46.h,
              textColor: isRecordingCompleted
                  ? AppColor.kWhite
                  : AppColor.kGrayscale40,
              width: 327.w,
            ),
            SizedBox(height: 16.h),
            Center(
              child: PrimaryTextButton(
                onPressed: () {
                  widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                title: 'Next Question',
                textStyle: appTextStyle.kBMediumMedium.copyWith(
                  color: AppColor.kGrayscaleDark100,
                ),
              ),
            ),
            SizedBox(height: 70.h),
          ],
        ),
      ),
    );
  }

  void _startOrStopRecording() async {
    try {
      if (isRecording) {
        recorderController!.reset();

        final path = await recorderController!.stop(false);

        if (path != null) {
          isRecordingCompleted = !isRecordingCompleted;
          debugPrint(path);
          debugPrint("Recorded file size: ${File(path).lengthSync()}");
        }
      } else {
        await recorderController!.record(path: path!);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isRecording = !isRecording;
      });
    }
  }
}
