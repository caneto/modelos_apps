// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kLandingBgColor,
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(bottom: 80.h),
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColor.kPrimary,
        unselectedItemColor: AppColor.kGrayscale40,
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        iconSize: 24.sp,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
        unselectedLabelStyle: TextStyle(
            color: AppColor.kPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                AppIcons.kHome,
              ),
            ),
            label: '•',
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                AppIcons.kHome,
                color: AppColor.kPrimary,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(AppIcons.kCalendar),
            ),
            label: '•',
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                AppIcons.kCalendar,
                color: AppColor.kPrimary,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(AppIcons.kActivity),
            ),
            label: '•',
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                AppIcons.kActivity,
                color: AppColor.kPrimary,
              ),
            ),
          ),BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(AppIcons.kProfile),
            ),
            label: '•',
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset(
                AppIcons.kProfile,
                color: AppColor.kPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
