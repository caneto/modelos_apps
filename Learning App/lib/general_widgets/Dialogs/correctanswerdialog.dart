import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/Dialogs/sharedialog.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';

class CorrectAnswerDialog extends StatelessWidget {
  const CorrectAnswerDialog(
      {super.key, required this.appTextStyle, required this.pageController, required this.onTap});
  final PageController pageController;
  final AppTextStyle appTextStyle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        backgroundColor: AppColor.kWhite,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32.h,
              ),
              Center(
                child: SizedBox(
                    width: 70.w,
                    height: 70.w,
                    child: Image.asset(ImagesPath.kCongrats)),
              ),
              SizedBox(
                height: 24.h,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset(AppIcons.kTickSquare),
                title: Text(
                  'Correct',
                  style: appTextStyle.kBLargeSemiBold
                      .copyWith(color: AppColor.kGrayscaleDark100),
                ),
                trailing: InkWell(
                  onTap: () {
                    Get.dialog(BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: ShareDialog(
                        onTap: () {
                          Get.close(2);
                        },
                      ),
                    ));
                  },
                  child: SvgPicture.asset(AppIcons.kSendIcon),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              PrimaryButton(
                onTap: onTap,
                text: 'Continue',
                bgColor: AppColor.kPrimary,
                borderRadius: 20.r,
                height: 46.h,
                textColor: AppColor.kWhite,
                width: 263.w,
                fontSize: 14.sp,
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
