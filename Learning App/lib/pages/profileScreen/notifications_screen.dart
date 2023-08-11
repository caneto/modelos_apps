import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/helper/countries_list.dart';
import 'package:learnkuy/general_widgets/simple_appbar.dart';
import 'package:learnkuy/models/county_list_model.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();

  int selectIndex = 0;
  bool isOff = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackground,
      appBar: SimpleAppBar(title: 'Notifications', appTextStyle: appTextStyle),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 43.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Message Notification',
                  style: appTextStyle.kBMediumSemiBold.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Card(
                  color: AppColor.kBackground,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColor.kNotificationColor)),
                  elevation: 0.2,
                  child: ListTile(
                    title: Text(
                      'Show Notifications',
                      style: appTextStyle.kBLargeMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: AppColor.kGrayscaleDark100),
                    ),
                    trailing: Switch(
                      value: isOff,
                      onChanged: (checked) {
                        setState(() {
                          isOff = checked;
                        });
                      },
                      thumbColor: MaterialStatePropertyAll(AppColor.kWhite),
                      activeColor: AppColor.kPrimary,
                      inactiveTrackColor: AppColor.kGrayscale40,
                      inactiveThumbColor: AppColor.kWhite,
                      trackOutlineColor:
                          MaterialStatePropertyAll(Colors.transparent),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
