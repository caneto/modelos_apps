import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  final AppTextStyle appTextStyle;
  const SimpleAppBar({
    Key? key,

    required this.title,
    required this.appTextStyle,
   
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: AppColor.kWhite,
        centerTitle: true,
        systemOverlayStyle: registerOverlay,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.kBackground),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.kGrayscaleDark100,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: appTextStyle.kBMediumSemiBold.copyWith(
              color: AppColor.kGrayscaleDark100,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp),
        ),
      );
  }
}
