import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/simple_appbar.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});
  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();
  bool isOff = true;
  bool isOff2 = true;
  bool isOff3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: SimpleAppBar(title: 'Security', appTextStyle: appTextStyle),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          SizedBox(
            height: 24.h,
          ),
          Card(
            color: AppColor.kBackground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side:
                    BorderSide(color: AppColor.kNotificationColor, width: 1.w)),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Remember Me',
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
                ListTile(
                  title: Text(
                    'Biometric ID',
                    style: appTextStyle.kBLargeMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: AppColor.kGrayscaleDark100),
                  ),
                  trailing: Switch(
                    value: isOff2,
                    onChanged: (checked) {
                      setState(() {
                        isOff2 = checked;
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
                ListTile(
                  title: Text(
                    'Face ID',
                    style: appTextStyle.kBLargeMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: AppColor.kGrayscaleDark100),
                  ),
                  trailing: Switch(
                    value: isOff3,
                    onChanged: (checked) {
                      setState(() {
                        isOff3 = checked;
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
