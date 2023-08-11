import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/general_widgets/Dialogs/premium_subscription_dialog.dart';
import 'package:learnkuy/models/lessons_model.dart';
import 'package:learnkuy/models/user_model.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

class DetailClassScreen extends StatefulWidget {
  const DetailClassScreen({super.key});

  @override
  State<DetailClassScreen> createState() => _DetailClassScreenState();
}

class _DetailClassScreenState extends State<DetailClassScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();

  int selectedChapterIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhite),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              child: Icon(
                Icons.more_vert,
                color: AppColor.kGrayscaleDark100,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        title: Text(
          'Arabic Language',
          style: appTextStyle.kBMediumSemiBold.copyWith(
              color: AppColor.kGrayscaleDark100,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColor.kWhite),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColor.kGrayscaleDark100,
                ),
              ),
            ),
          ),
        ),
        elevation: 0,
        systemOverlayStyle: registerOverlay,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 40.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '32 Lessons',
              style: appTextStyle.kBLargeTextstyle.copyWith(
                  color: AppColor.kGrayscaleDark100,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Wrap(
              children: List<Widget>.generate(lessonTypeList.length, (index) {
                LessonTypeModel lessonType = lessonTypeList[index];
                return ExpansionTile(
                  backgroundColor: AppColor.kWhite,
                  collapsedBackgroundColor: AppColor.kWhite,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  collapsedIconColor: AppColor.kPrimary,
                  iconColor: AppColor.kPrimary,
                  leading: SvgPicture.asset(
                    lessonType.icon,
                    color: AppColor.kGrayscaleDark100,
                    width: 24.w,
                    height: 24.w,
                  ),
                  title: Text(
                    lessonType.title,
                    style: appTextStyle.kBLargeSemiBold.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.kGrayscaleDark100,
                        fontSize: 16.sp),
                  ),
                  children: List<Widget>.generate(
                    chaptersList.length,
                    (index) => ListTile(
                      onTap: () {
                        setState(() {
                          if (selectedChapterIndex == index) {
                            selectedChapterIndex =
                                -1; // Deselect the current item
                          } else {
                            selectedChapterIndex =
                                index; // Select the clicked item
                          }
                        });
                        // Additional logic can be added based on the selected item
                        if (currentUser.isPremium ==
                            chaptersList[index].isPremium) {
                          Get.dialog(PremiumSubscriptionDialog(
                              appTextStyle: appTextStyle));
                        } else {}
                      },
                      leading: Text(
                        '${index + 1}',
                        style: appTextStyle.kBMediumSemiBold.copyWith(
                          color: AppColor.kGrayscaleDark100,
                        ),
                      ),
                      title: Text(
                        chaptersList[index].title,
                        style: appTextStyle.kBMediumSemiBold.copyWith(
                          color: AppColor.kGrayscaleDark100,
                        ),
                      ),
                      subtitle: Text(
                        chaptersList[index].subtitle,
                        style: appTextStyle.kBSmallMedium.copyWith(
                          color: AppColor.kGrayscale40,
                        ),
                      ),
                      trailing:
                          currentUser.isPremium == chaptersList[index].isPremium
                              ? Container(
                                  width: 28.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    color: AppColor.kWarning,
                                    border: Border.all(
                                      color: AppColor.kLine,
                                    ),
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SvgPicture.asset(AppIcons.kLock,
                                        color: AppColor.kWhite),
                                  ),
                                )
                              : Container(
                                  width: 28.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    color: selectedChapterIndex == index
                                        ? AppColor.kPrimary
                                        : AppColor.kWhite,
                                    border: Border.all(
                                      color: selectedChapterIndex == index
                                          ? AppColor.kPrimary
                                          : AppColor.kLine,
                                    ),
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  child: Icon(
                                    selectedChapterIndex == index
                                        ? Icons.check
                                        : Icons.circle_outlined,
                                    color: AppColor.kWhite,
                                  )),
                    ),
                  ),
                );
              }),
            ),

         
            
          ]),
        ),
      ),
    );
  }
}
