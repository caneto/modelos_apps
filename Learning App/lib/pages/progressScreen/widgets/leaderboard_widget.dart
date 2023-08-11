import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnkuy/models/progress_model.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class LeaderBoardWidget extends StatelessWidget {
  const LeaderBoardWidget({
    super.key,
    required this.progressList,
    required this.appTextStyle,
    required this.index,
  });
  final List<ProgressModel> progressList;
  final AppTextStyle appTextStyle;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      child: Column(children: [
        SizedBox(
          width: 50.w,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundImage:
                      AssetImage(progressList[index].userModel.profileImage),
                ),
              ),
              Positioned(
                  top: 55.h,
                  left: 15.w,
                  child: SvgPicture.asset(AppIcons.kMedal))
            ],
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${progressList[index].id}.${progressList[index].userModel.name}',
                style: appTextStyle.kBMediumSemiBold.copyWith(
                    color: AppColor.kWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp),
                overflow: TextOverflow.clip,
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
                decoration: BoxDecoration(
                    color: AppColor.kWhite,
                    borderRadius: BorderRadius.circular(16.r)),
                width: 80.w,
                height: 28.h,
                child: Center(
                  child: Text(
                    '${progressList[index].lessonsCount} Lessons',
                    style: appTextStyle.kBSmallMedium.copyWith(
                        color: AppColor.kPrimary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
