
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/utils/colors.dart';

class BackCircleArrowButton extends StatelessWidget {
  const BackCircleArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back<void>();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 40.w,
          height: 40.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h)
              .copyWith(right: 7.w, top: 7.h),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColor.kBackground),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.kGrayscaleDark100,
          ),
        ),
      ),
    );
  }
}
