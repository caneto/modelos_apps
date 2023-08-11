import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class ShareDialog extends StatelessWidget {
  ShareDialog({
    super.key,
    required this.onTap,
  });

  AppTextStyle appTextStyle = AppTextStyle();

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 32.h,
            ),
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColor.kLine,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Get.close(2);
                },
                icon: SvgPicture.asset(AppIcons.kGreyCancel),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Social Media',
              style: appTextStyle.kBLargeTextstyle
                  .copyWith(color: AppColor.kGrayscaleDark100),
            ),
            SizedBox(
              height: 16.h,
            ),
            ShareTitle(
              appTextStyle: appTextStyle,
              title: 'Whatsapp',
              icon: AppIcons.kWhatsapp,
            ),
            SizedBox(
              height: 14.h,
            ),
            ShareTitle(
              appTextStyle: appTextStyle,
              title: 'Telegram',
              icon: AppIcons.kTelegram,
            ),
            SizedBox(
              height: 14.h,
            ),
            ShareTitle(
              appTextStyle: appTextStyle,
              title: 'Instagram',
              icon: AppIcons.kInstagram,
            ),
            SizedBox(
              height: 14.h,
            ),
            ShareTitle(
              appTextStyle: appTextStyle,
              title: 'Copy Link',
              icon: AppIcons.kCopyLink,
            ),
            SizedBox(
              height: 24.h,
            ),
            PrimaryButton(
              elevation: 0,
              onTap: onTap,
              text: 'Continue',
              bgColor: AppColor.kPrimary,
              borderRadius: 20.r,
              height: 46.h,
              textColor: AppColor.kWhite,
              width: 263.w,
            ),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}

class ShareTitle extends StatelessWidget {
  const ShareTitle({
    super.key,
    required this.appTextStyle,
    required this.icon,
    required this.title,
  });
  final String icon;
  final String title;

  final AppTextStyle appTextStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColor.kLine,
          shape: BoxShape.circle,
        ),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColor.kLine,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: SvgPicture.asset(icon)),
      ),
      title: Text(
        title,
        style: appTextStyle.kBLargeSemiBold
            .copyWith(color: AppColor.kGrayscaleDark100),
      ),
    );
  }
}
