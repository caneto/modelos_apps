import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnkuy/data/helper/countries_list.dart';
import 'package:learnkuy/general_widgets/custom_appbar.dart';
import 'package:learnkuy/general_widgets/custom_carousel_slider.dart';
import 'package:learnkuy/models/user_model.dart';
import 'package:learnkuy/pages/calendarScreen/widgets/countryclass_container.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

import 'widgets/horizontal_calender_widget.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();
  var selectedDate = DateTime.now();
  CarouselController calenderCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        profileImage: currentUser.profileImage,
        name: currentUser.name,
        address: currentUser.address,
        appTextStyle: appTextStyle,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColor.kWhite,
                ),
                child: HorizontalWeekCalendar(
                  borderRadius: BorderRadius.circular(20),
                  weekStartFrom: WeekStartFrom.Monday,
                  activeBackgroundColor: AppColor.kPrimary,
                  disabledBackgroundColor: Colors.transparent,
                  activeNavigatorColor: AppColor.kGrayscaleDark100,
                  inactiveBackgroundColor: Colors.transparent,
                  inactiveNavigatorColor: AppColor.kGrayscaleDark100,
                  monthColor: Colors.transparent,
                  onWeekChange: (p0) {
             
                  },
                  onDateChange: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 280.h,
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Wrap(
                  children: List.generate(
                    countriesList.length,
                    (index) {
                      final countries = countriesList[index];
                      return CountryClassContainer(
                          countries: countries, appTextStyle: appTextStyle);
                    },
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    top: 10.h,
                  ),
                  child: Text(
                    'Your Target',
                    style: appTextStyle.kBSmallSemiBold.copyWith(
                        color: AppColor.kGrayscaleDark100,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                ),
                CustomCarouselSlider(
                    appTextStyle: appTextStyle,
                    carouselController: calenderCarouselController),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
