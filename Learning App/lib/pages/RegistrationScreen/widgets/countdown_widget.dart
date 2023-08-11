import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/typography.dart';

class Countdown extends StatefulWidget {
  const Countdown({super.key});

  @override
  State<Countdown> createState() => CountdownState();
}

class CountdownState extends State<Countdown> {
  Duration limit = 1.minutes;
  final AppTextStyle appTextStyle = AppTextStyle();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(1.seconds, (_) {
      setState(() {
        limit = limit == 0.seconds ? 1.minutes : (limit - 1.seconds);
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Resend code in  ',
          style: appTextStyle.kBMediumMedium.copyWith(
              color: AppColor.kGrayscale40,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp),
        ),
        Text(
          '00:${limit.inSeconds} ',
          style: appTextStyle.kBMediumMedium.copyWith(
              color: AppColor.kGrayscaleDark100,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp),
        ),
      ],
    );
  }
}
