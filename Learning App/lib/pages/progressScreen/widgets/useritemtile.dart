import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/models/progress_model.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class UserItemTile extends StatelessWidget {
  const UserItemTile({
    super.key,
    required this.selectedList,
    required this.appTextStyle,
    required this.index,
  });
  final int index;
  final List<ProgressModel> selectedList;
  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SizedBox(
            width: 60.w,
            height: 60.w,
            child: Row(
              children: [
                Text(
                  selectedList[index].id.toString(),
                  style: appTextStyle.kBMediumSemiBold.copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  width: 6.w,
                ),
                SizedBox(
                  width: 35.w,
                  height: 35.w,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage(selectedList[index].userModel.profileImage),
                  ),
                )
              ],
            ),
          ),
          title: Text(
            selectedList[index].userModel.name,
            style: appTextStyle.kBMediumSemiBold.copyWith(
                color: AppColor.kGrayscaleDark100,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
            overflow: TextOverflow.clip,
          ),
          trailing: Container(
            padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: AppColor.kPrimary,
                borderRadius: BorderRadius.circular(16.r)),
            child: Text(
              '${selectedList[index].lessonsCount} Lessons',
              style: appTextStyle.kBSmallMedium.copyWith(
                  color: AppColor.kWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            ),
          ),
        ),
        Divider(
          color: AppColor.kDividerColor,
          thickness: 0.4,
        )
      ],
    );
  }
}
