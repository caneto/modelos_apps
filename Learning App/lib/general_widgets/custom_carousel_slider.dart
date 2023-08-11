import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/helper/countries_list.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.appTextStyle,
    required this.carouselController,
  });

  final AppTextStyle appTextStyle;
  final CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
          countriesList.length - 36,
          (index) => SizedBox(
                width: Get.width,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 10.w),
                        width: 327.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: AppColor.kGrayscaleDark100,
                          borderRadius: BorderRadius.circular(
                            24.r,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.w, top: 22.h, right: 22.w),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                    radius: 30.r,
                                    backgroundImage:
                                        NetworkImage(countriesList[index].flag),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.h,
                                ),
                                SizedBox(
                                  width: 129.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        countriesList[index].name,
                                        style: appTextStyle
                                            .kBExtraLargeTextstyle
                                            .copyWith(
                                                color: AppColor.kWhite,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        'Congratulation You’re intermediate level now!',
                                        style: appTextStyle.kBExtraSmallMedium
                                            .copyWith(
                                                color: AppColor.kWhite,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10.sp),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      PrimaryButton(
                                        elevation: 0,
                                        width: 77.w,
                                        height: 28.h,
                                        onTap: () {},
                                        text: 'Continue',
                                        textColor: AppColor.kWhite,
                                        bgColor: AppColor.kPrimary,
                                        borderRadius: 12.r,
                                        fontSize: 12.sp,
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SfRadialGauge(
                                      enableLoadingAnimation: true,
                                      animationDuration: 4500,
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                            radiusFactor: 1.27,
                                            canScaleToFit: true,
                                            showTicks: true,
                                            showLabels: false,
                                            // showAxisLine: false,
                                            minorTicksPerInterval: 10,
                                            majorTickStyle:
                                                const MajorTickStyle(
                                                    length: 0.1,
                                                    lengthUnit: GaugeSizeUnit
                                                        .logicalPixel,
                                                    thickness: 1,
                                                    color: Colors.white),
                                            minorTickStyle:
                                                const MinorTickStyle(
                                                    length: 0.5,
                                                    lengthUnit: GaugeSizeUnit
                                                        .logicalPixel,
                                                    thickness: 1,
                                                    color: Colors.white),
                                            ranges: <GaugeRange>[
                                              GaugeRange(
                                                  startValue: 0,
                                                  endValue: 80,
                                                  color: AppColor.kPrimary,
                                                  startWidth: 10,
                                                  endWidth: 10),
                                            ],
                                            pointers: const <GaugePointer>[
                                              // NeedlePointer(
                                              //   value: 30,
                                              // ),
                                            ],
                                            annotations: <GaugeAnnotation>[
                                              GaugeAnnotation(
                                                  widget: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 40.h),
                                                      child: Text('30%',
                                                          style: appTextStyle
                                                              .kBMediumMedium
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14.sp))),
                                                  angle: 90,
                                                  positionFactor: 0.5)
                                            ])
                                      ]),
                                )
                              ]),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1.h,
                      left: 187.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            color: AppColor.kRed400,
                            borderRadius: BorderRadius.circular(24.r)),
                        height: 28.h,
                        child: Center(
                          child: Text(
                            'Target Today',
                            style: appTextStyle.kBSmallMedium.copyWith(
                                color: AppColor.kWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 9.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: DotsIndicator(
                          dotsCount: countriesList.length - 36,
                          position: index,
                          decorator: DotsDecorator(
                            color: AppColor.kPrimary.withOpacity(0.4),
                            size: const Size.square(8.0),
                            activeSize: const Size(20.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            activeColor: AppColor.kPrimary,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
      carouselController: carouselController,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        initialPage: 1,
      ),
    );
  }
}
