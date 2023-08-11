import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/helper/countries_list.dart';
import 'package:learnkuy/general_widgets/simple_appbar.dart';
import 'package:learnkuy/models/county_list_model.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class LanguageScreen extends StatefulWidget {
  LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();

  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: SimpleAppBar(title: 'Language', appTextStyle: appTextStyle),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 43.h),
            child: Text(
              'Suggested Languages',
              style: appTextStyle.kBMediumMedium.copyWith(
                color: AppColor.kGrayscaleDark100,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 15.w, top: 24.h),
            child: SizedBox(
              height: 700.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: countriesList.length,
                itemBuilder: (context, index) {
                  CountriesList countries = countriesList[index];
                  return Card(
                    elevation: 0.3,
                    color: selectIndex == index
                        ? AppColor.kBackground
                        : AppColor.kBackground2,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      contentPadding: EdgeInsets.only(left: 4.w),
                      title: Text(
                        countries.name,
                        style: appTextStyle.kBMediumMedium.copyWith(
                          color: AppColor.kGrayscaleDark100,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      trailing: SizedBox(
                        width: 106.w,
                        height: 36.h,
                        child: selectIndex == index
                            ? Icon(
                                Icons.check,
                                color: selectIndex == index
                                    ? AppColor.kPrimary
                                    : AppColor.kWhite,
                                size: 18.sp,
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
