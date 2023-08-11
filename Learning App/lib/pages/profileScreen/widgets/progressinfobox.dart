import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class ProgressInfoBox extends StatelessWidget {
  const ProgressInfoBox({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 221.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Khalid Mohammed',
            style: appTextStyle.kBLargeSemiBold.copyWith(
                color: AppColor.kGrayscaleDark100,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp),
          ),
          SizedBox(
            height: 4.w,
          ),
          Text(
            'Medium Level',
            style: appTextStyle.kBExtraSmallMedium.copyWith(
                color: AppColor.kGrayscale40,
                fontWeight: FontWeight.w500,
                fontSize: 10.sp),
          ),
          SizedBox(
            height: 8.w,
          ),
          LinearProgressIndicator(
            backgroundColor: AppColor.kBackground2,
            minHeight: 23.h,
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.kPrimary),
            value: 0.5,
            // borderRadius: BorderRadius.circular(12.r),
          )
        ]),
      ),
    );
  }
}
