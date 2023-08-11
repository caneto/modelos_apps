import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class OptionsTile extends StatelessWidget {
  const OptionsTile(
      {super.key,
      required this.appTextStyle,
      required this.icons,
      required this.onTab,
      required this.title});
  final String icons, title;
  final AppTextStyle appTextStyle;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTab,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40.w,
        height: 40.h,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhite),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          child: SvgPicture.asset(icons),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Text(
          title,
          style: appTextStyle.kBMediumSemiBold.copyWith(
              color: AppColor.kGrayscaleDark100,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp),
        ),
      ),
      trailing: SvgPicture.asset(AppIcons.kArrow),
    );
  }
}
