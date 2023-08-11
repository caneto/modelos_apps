import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class LessonsRow extends StatelessWidget {
  const LessonsRow({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Your Lessons',
              style: appTextStyle.kBLargeSemiBold.copyWith(
                  color: AppColor.kGrayscaleDark100,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp)),
          PrimaryTextButton(
              onPressed: () {},
              title: 'See More',
              textStyle: appTextStyle.kBSmallSemiBold.copyWith(
                  color: AppColor.kPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp))
        ],
      ),
    );
  }
}
