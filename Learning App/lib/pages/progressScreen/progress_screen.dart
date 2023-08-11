import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/models/progress_model.dart';
import 'package:learnkuy/pages/progressScreen/widgets/leaderboard_widget.dart';
import 'package:learnkuy/pages/progressScreen/widgets/useritemtile.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();
  ProgressType selectedProgress = ProgressType.weekly;
  List<ProgressModel> selectedList = [];
  List<ProgressModel>? selectProgressMethod(ProgressType currentProgressType) {
    List<ProgressModel> selectChip = progressList
        .where((element) => element.leaderType.name == currentProgressType.name)
        .toList();
    if (kDebugMode) {
      print('currentProgressType ${currentProgressType.name}');
    }
    if (kDebugMode) {
      print('selected list ${selectChip.length}');
    }
    selectChip.sort((a, b) => b.lessonsCount.compareTo(a.lessonsCount));
    return selectChip;
  }

  @override
  void initState() {
    super.initState();

    selectedList = selectProgressMethod(selectedProgress) ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.kPrimary,
        toolbarHeight: 350.h,
        flexibleSpace: Container(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 60.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    Text(
                      'Leaderboard',
                      style: appTextStyle.kBExtraLargeSemiBold.copyWith(
                          color: AppColor.kWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back<void>();
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade500),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            AppIcons.kMoreVer,
                            width: 12.w,
                            height: 12.h,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 24.w, top: 38.h, left: 24.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: ProgressType.values
                          .map((progress) => Padding(
                                padding: EdgeInsets.only(
                                  right: 11.w,
                                ),
                                child: ActionChip(
                                    elevation: 0,
                                    side: BorderSide(color: AppColor.kWhite),
                                    backgroundColor:
                                        progress == selectedProgress
                                            ? AppColor.kWhite
                                            : AppColor.kPrimary,
                                    onPressed: () {
                                      setState(() {
                                        selectedProgress = progress;

                                        if (kDebugMode) {
                                          print(
                                              'selectedProgress $selectedProgress');
                                        }
                                        selectedList = selectProgressMethod(
                                                selectedProgress) ??
                                            [];
                                      });
                                    },
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.h, horizontal: 16.w),
                                    label: Text(
                                      progress.name.capitalizeFirst!,
                                      style: appTextStyle.kBMediumSemiBold
                                          .copyWith(
                                              color:
                                                  progress == selectedProgress
                                                      ? AppColor.kPrimary
                                                      : AppColor.kWhite,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp),
                                    )),
                              ))
                          .toList()),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 25.w, top: 30.h, left: 30.w),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                      selectedList.getRange(0, 3).length,
                      (index) => LeaderBoardWidget(
                          appTextStyle: appTextStyle,
                          index: index,
                          progressList: selectedList)),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Wrap(
          children: List.generate(
            selectedList.length,
            (index) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: UserItemTile(
                  index: index,
                  selectedList: selectedList,
                  appTextStyle: appTextStyle),
            ),
          ),
        ),
      ),
    );
  }
}
