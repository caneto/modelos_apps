import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/passwordtextfield.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/pages/RegistrationScreen/explore_screen.dart';
import 'package:learnkuy/pages/RegistrationScreen/widgets/backcircle_arrowbutton.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({super.key});

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmC = TextEditingController();
  final AppTextStyle appTextStyle = AppTextStyle();
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 180.h)
            .copyWith(bottom: 0),
        child: SizedBox(
          width: 330.w,
          child: Column(children: [
            SizedBox(
              width: 134.w,
              height: 134.w,
              child: Image.asset(ImagesPath.kMaps),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ).copyWith(top: 12.h),
              child: SizedBox(
                width: 315.w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Enable Location',
                        textAlign: TextAlign.center,
                        style: appTextStyle.kH5SemiBoldTextstyle.copyWith(
                            color: AppColor.kGrayscaleDark100,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Kindly allow us to access your location to provide you with suggestions for nearby salons',
                        textAlign: TextAlign.center,
                        style: appTextStyle.kBMediumMedium.copyWith(
                            color: AppColor.kGrayscale40,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            PrimaryButton(
              elevation: 0,
              onTap: () {
                Get.to(() => const ExploreScreen());
              },
              text: 'Enable',
              bgColor: AppColor.kPrimary,
              borderRadius: 20.r,
              height: 46.h,
              width: 327.w,
              textColor: AppColor.kWhite,
            ),
            SizedBox(
              height: 24.h,
            ),
            PrimaryTextButton(
              onPressed: () {
                Get.to(() => const ExploreScreen());
              },
              textStyle: appTextStyle.kBMediumMedium.copyWith(
                  color: AppColor.kGrayscaleDark100,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp),
              title: 'Skip, Not Now',
            )
          ]),
        ),
      ),
    );
  }
}
