
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/models/county_list_model.dart';
import 'package:learnkuy/pages/calendarScreen/detail_class_screen.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class CountryClassContainer extends StatelessWidget {
  const CountryClassContainer({
    super.key,
    required this.countries,
    required this.appTextStyle,
  });

  final CountriesList countries;
  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
              horizontal: 24.w, vertical: 16.h)
          .copyWith(bottom: 0),
      child: Container(
        padding: EdgeInsets.only(
            left: 23.w, top: 16.h, right: 24.w),
        decoration: BoxDecoration(
          color: AppColor.kWhite,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  countries.name,
                  style: appTextStyle.kBSmallSemiBold
                      .copyWith(
                          color: AppColor.kGrayscaleDark100,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColor.kPrimaryTinyLight,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '06:30',
                    style: appTextStyle.kBExtraSmallSemiBold
                        .copyWith(
                            color: AppColor.kPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.w,
            ),
            ListTile(
              onTap: () {
                Get.to(() => const DetailClassScreen());
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColor.kPrimary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(17.r),
                  image: DecorationImage(
                    image: NetworkImage(
                      countries.flag,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                'Learning Arabic grammar',
                style: appTextStyle.kBSmallSemiBold.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
              subtitle: Text(
                '6/12 Lessons',
                style: appTextStyle.kBSmallMedium.copyWith(
                    color: AppColor.kGrayscale40,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp),
              ),
              trailing: SvgPicture.asset(
                AppIcons.kArrow,
                width: 24.w,
                height: 24.h,
                color: AppColor.kPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
