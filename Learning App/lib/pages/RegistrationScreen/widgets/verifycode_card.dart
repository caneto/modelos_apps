
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/custom_richtext.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class VerifyCodeCard extends StatelessWidget {
  const VerifyCodeCard({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 53.w, right: 25.w, top: 12.h),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verify Code',
              textAlign: TextAlign.center,
              style: appTextStyle.kH5SemiBoldTextstyle.copyWith(
                  color: AppColor.kGrayscaleDark100,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomRichText(
              title:
                  'Please enter the code we just sent to    email ',
              subtitle: 'jaydonfranci@email.com',
              onTab: () {},
              subtitleTextStyle: appTextStyle.kBMediumMedium
                  .copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
            )
          ]),
    );
  }
}
