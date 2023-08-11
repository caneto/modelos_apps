import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/data/helper/countries_list.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/main.dart';
import 'package:learnkuy/models/county_list_model.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/backcircle_arrowbutton.dart';
import 'package:learnkuy/pages/landingScreen/landing_screen.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';
import 'package:network_to_file_image/network_to_file_image.dart';

import 'package:path/path.dart' as p;

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmC = TextEditingController();
  final AppTextStyle appTextStyle = AppTextStyle();

  int selectIndex = 0;
  File fileFromDocsDir(String filename) {
    String pathName = p.join(appDocsDir!.path, filename);
    return File(pathName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: registerOverlay,
        backgroundColor: Colors.transparent,
        leading: const BackCircleArrowButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 26.h),
          child: SizedBox(
            width: 330.w,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: SizedBox(
                  width: 315.w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What is Your Mother Language',
                          style: appTextStyle.kH5SemiBoldTextstyle.copyWith(
                              color: AppColor.kGrayscaleDark100,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Discover what is a podcast description and podcast summary.',
                          style: appTextStyle.kBMediumMedium.copyWith(
                              color: AppColor.kGrayscale40,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 486.h,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: countriesList.length,
                  itemBuilder: (context, index) {
                    CountriesList countries = countriesList[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: selectIndex == index
                              ? Colors.white10
                              : AppColor.kBackground,
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(
                            color: AppColor.kLine,
                            width: 0.4.w,
                          ),
                        ),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r)),
                          color: selectIndex == index
                              ? Colors.white10
                              : AppColor.kBackground,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                selectIndex = index;
                              });
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkToFileImage(
                                  url: countries.flag,
                                  file:
                                      fileFromDocsDir("${countries.name}.png"),
                                  debug: true),
                            ),
                            title: Text(countries.name),
                            trailing: SizedBox(
                              width: 106.w,
                              height: 36.h,
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    side: BorderSide(
                                      color: AppColor.kLine,
                                    ),
                                    backgroundColor: selectIndex == index
                                        ? AppColor.kPrimary
                                        : AppColor.kBackground2,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectIndex = index;
                                    });
                                  },
                                  icon: selectIndex == index
                                      ? Icon(
                                          Icons.check,
                                          color: AppColor.kWhite,
                                          size: 18.sp,
                                        )
                                      : const SizedBox.shrink(),
                                  label: Text(
                                    'Select',
                                    style: selectIndex == index
                                        ? appTextStyle.kBMediumMedium
                                        : appTextStyle.kBMediumMedium.copyWith(
                                            color: AppColor.kGrayscale40),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              PrimaryButton(
                elevation: 0,
                onTap: () {
                  Get.off(() => const LandingScreen());
                },
                text: 'Continue',
                bgColor: AppColor.kPrimary,
                borderRadius: 20.r,
                height: 46.h,
                width: 327.w,
                textColor: AppColor.kWhite,
                fontSize: 14.sp,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
