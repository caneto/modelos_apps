import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String profileImage;
  final String name;
  final String address;
  final AppTextStyle appTextStyle;
  const CustomAppBar({
    Key? key,
    required this.profileImage,
    required this.name,
    required this.appTextStyle,
    required this.address,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: 20.r,
          backgroundImage: AssetImage(profileImage),
        ),
      ),
      systemOverlayStyle: registerOverlay,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, $name',
            style: appTextStyle.kBSmallMedium.copyWith(
                color: AppColor.kGrayscale40,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            address,
            style: appTextStyle.kBSmallSemiBold.copyWith(
                color: AppColor.kGrayscaleDark100,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp),
          )
        ],
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.kWhite,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                AppIcons.kSearch,
                width: 12.w,
                height: 12.w,
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        InkWell(
          onTap: () {},
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhite),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                AppIcons.kNotification,
                width: 12.w,
                height: 12.w,
                color: AppColor.kPrimary,
              ),
            ),
          ),
        ),
        SizedBox(width: 24.w),
      ],
    );
  }
}
