import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class DividerRow extends StatelessWidget {
  final String title;
  DividerRow({
    required this.title,
    super.key,
  });
  AppTextStyle _appTextStyle = AppTextStyle();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Divider(
              color: AppColor.kLine,
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Text(
            title,
            style: _appTextStyle.kBMediumMedium.copyWith(
                color: AppColor.kGrayscale40,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp),
          ),
        ),
        Expanded(
            flex: 2,
            child: Divider(
              color: AppColor.kLine,
            ))
      ],
    );
  }
}
