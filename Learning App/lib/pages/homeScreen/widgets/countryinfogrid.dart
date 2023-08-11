import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/data/helper/countries_list.dart';
import 'package:learnkuy/general_widgets/customtrack_shape.dart';

import 'package:learnkuy/models/county_list_model.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class CountryInfoGrid extends StatelessWidget {
  final CountriesList countries;
  final AppTextStyle appTextStyle;
  const CountryInfoGrid({
    Key? key,
    required this.countries,
    required this.appTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
          color: AppColor.kWhite, borderRadius: BorderRadius.circular(25.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 11.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(countries.flag),
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  get(countries.name),
                  style: appTextStyle.kBMediumSemiBold.copyWith(
                      color: AppColor.kGrayscaleDark100,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Common Korean Language',
                  style: appTextStyle.kBExtraSmallMedium.copyWith(
                      color: AppColor.kGrayscale40,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${countries.percentage.toString().split('.')[0].toString()}%',
                      style: appTextStyle.kBExtraSmallMedium.copyWith(
                          color: AppColor.kPrimary,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp),
                    ),
                  ],
                ),
                SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 20.h,
                      trackShape: CustomTrackShape(),
                    ),
                    child: Slider(
                        activeColor: AppColor.kPrimary.withOpacity(0.3),
                        thumbColor: AppColor.kPrimary,
                        inactiveColor: AppColor.kBackground2,
                        min: 0.0,
                        max: 1.0,
                        value: 0 +
                            double.parse(
                                '.${countries.percentage.toString().split('.')[0]}'),
                        onChanged: (val) {}))
              ],
            ),
          )
        ],
      ),
    );
  }
}
