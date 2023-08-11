import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/Dialogs/logoutdialog.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/pages/RegistrationScreen/signin_screen.dart';
import 'package:learnkuy/pages/profileScreen/edit_screen.dart';
import 'package:learnkuy/pages/profileScreen/helpandsupport_screen.dart';
import 'package:learnkuy/pages/profileScreen/language_screen.dart';
import 'package:learnkuy/pages/profileScreen/legalandpolicies_screen.dart';
import 'package:learnkuy/pages/profileScreen/notifications_screen.dart';
import 'package:learnkuy/pages/profileScreen/security_screen.dart';
import 'package:learnkuy/pages/profileScreen/subscriptions_screen.dart';
import 'package:learnkuy/pages/profileScreen/widgets/optionstile.dart';
import 'package:learnkuy/pages/profileScreen/widgets/progressinfobox.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AppTextStyle appTextStyle = AppTextStyle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => EditScreen());
            },
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhite),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: SvgPicture.asset(AppIcons.kEditIcon),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
        title: Text(
          'Edit Profile',
          style: appTextStyle.kBMediumSemiBold.copyWith(
              color: AppColor.kGrayscaleDark100,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhite),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColor.kGrayscaleDark100,
              ),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            width: 327.w,
            child: Row(children: [
              Container(
                width: 94.h,
                height: 94.h,
                decoration: BoxDecoration(
                    color: AppColor.kWhite,
                    borderRadius: BorderRadius.circular(51.r),
                    image: DecorationImage(
                      image: AssetImage(ImagesPath.kAvatar),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 12.w,
              ),
              ProgressInfoBox(appTextStyle: appTextStyle)
            ]),
          ),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 19.h,
                  right: 9.w,
                  left: 24.w,
                ),
                child: SizedBox(
                  width: 342.w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'General',
                          style: appTextStyle.kBMediumMedium.copyWith(
                              color: AppColor.kGrayscale40,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        OptionsTile(
                          appTextStyle: appTextStyle,
                          icons: AppIcons.kSettingIcon,
                          title: 'Settings',
                          onTab: () {
                            Get.to(() => SecurityScreen());
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        OptionsTile(
                          appTextStyle: appTextStyle,
                          icons: AppIcons.kNotification,
                          title: 'Notification',
                          onTab: () {
                            Get.to(() => NotificationsScreen());
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        OptionsTile(
                          appTextStyle: appTextStyle,
                          icons: AppIcons.kProfileCircle,
                          title: 'Subscription',
                          onTab: () {
                            Get.to(() => const SubscriptionsScreen());
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        OptionsTile(
                          appTextStyle: appTextStyle,
                          icons: AppIcons.kGlobal,
                          title: 'Language',
                          onTab: () {
                            Get.to(() => LanguageScreen());
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Support',
                          style: appTextStyle.kBMediumMedium.copyWith(
                            color: AppColor.kGrayscale40,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        OptionsTile(
                          appTextStyle: appTextStyle,
                          icons: AppIcons.k24support,
                          title: 'Help Center',
                          onTab: () {
                            Get.to(() => const HelpAndSupportScreen());
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        OptionsTile(
                          appTextStyle: appTextStyle,
                          icons: AppIcons.kInfoCircle,
                          title: 'About Us',
                          onTab: () {
                            Get.to(() => LegalPoliciesScreen());
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        SizedBox(
                          width: 342.w,
                          child: Center(
                            child: PrimaryTextButton(
                              onPressed: () {
                                Get.dialog(
                                    LogOutDialog(appTextStyle: appTextStyle));
                              },
                              title: 'LogOut',
                              textStyle: appTextStyle.kBLargeSemiBold.copyWith(
                                  color: AppColor.kError,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                      ]),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
