import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class PremiumSubscriptionDialog extends StatelessWidget {
  const PremiumSubscriptionDialog({
    super.key,
    required this.appTextStyle,
  });

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: AppColor.kWhite,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32.h,
              ),
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: AppColor.kLine,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.close(2);
                  },
                  icon: SvgPicture.asset(AppIcons.kGreyCancel),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Subscribe Premium Account',
                style: appTextStyle.kBLargeTextstyle.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Has three options premium benefits',
                style: appTextStyle.kBMediumMedium.copyWith(
                    color: AppColor.kGrayscale40,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              const DottedLine(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Colors.black,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
              SizedBox(
                height: 24.h,
              ),
              //create a richText
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.kCrown,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\$14.90',
                      style: appTextStyle.kH3SemiBoldTextstyle.copyWith(
                          color: AppColor.kGrayscaleDark100,
                          fontWeight: FontWeight.w600,
                          fontSize: 32.sp),
                      children: <TextSpan>[
                        TextSpan(
                          text: '/Month',
                          style: appTextStyle.kBLargeMedium.copyWith(
                              color: AppColor.kGrayscaleDark100,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  textRow(text: 'Premium reporting & Analytics'),
                  SizedBox(
                    height: 12.w,
                  ),
                  textRow(text: '24/7 Support Chat'),
                  SizedBox(
                    height: 12.w,
                  ),
                  textRow(text: '500GB  Cloud memory ')
                ],
              ),
              SizedBox(
                height: 40.w,
              ),
              PrimaryButton(
                elevation: 0,
                onTap: () {
                  Get.back<void>();
                },
                text: 'Continue',
                bgColor: AppColor.kPrimary,
                borderRadius: 20.r,
                height: 46.h,
                textColor: AppColor.kWhite,
                width: 263.w,
                fontSize: 14.sp,
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row textRow({required String text}) {
    return Row(
      children: [
        Container(
            width: 24.0.w,
            height: 24.0.w,
            decoration: BoxDecoration(
                color: AppColor.kSecondary, shape: BoxShape.circle),
            child: Icon(
              Icons.check,
              color: AppColor.kWhite,
            )),
        SizedBox(
          width: 8.w,
        ),
        Text(
          text,
          style: appTextStyle.kBMediumMedium.copyWith(
              color: AppColor.kGrayscaleDark100,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp),
        )
      ],
    );
  }
}
