import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/data/helper/countries_list.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/general_widgets/primarytextfield.dart';
import 'package:learnkuy/general_widgets/simple_appbar.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/images_path.dart';
import 'package:learnkuy/utils/typography.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditScreen extends StatefulWidget {
  EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();

  TextEditingController emailC = TextEditingController();

  TextEditingController passwordC = TextEditingController();

  String selectedOption = 'English_(US)';
  File? frontImage;
  File? backImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: SimpleAppBar(title: 'Edit Profile', appTextStyle: appTextStyle),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(top: 16.h),
            child: Container(
              width: 327.w,
              height: 163.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16.r),
                // image: DecorationImage(
                //   image: AssetImage(ImagesPath.kAvatar),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120.h,
                    decoration: BoxDecoration(
                      image: backImage != null
                          ? DecorationImage(
                              image: FileImage(backImage!),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: AssetImage(ImagesPath.kBackground),
                              fit: BoxFit.cover,
                            ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  InkWell(
                    onTap: pickBackImage,
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 60.h, left: 112.w, right: 112.w),
                      width: 94.h,
                      height: 94.h,
                      decoration: BoxDecoration(
                        color: AppColor.kWhite,
                        borderRadius: BorderRadius.circular(51.r),
                        image: frontImage != null
                            ? DecorationImage(
                                image: FileImage(frontImage!),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: AssetImage(ImagesPath.kAvatar),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 180.w,
                    top: 110.h,
                    child: InkWell(
                      onTap: pickFrontImage,
                      child: Image.asset(
                        ImagesPath.kEdit,
                        width: 32.w,
                        height: 32.h,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 250.w,
                    top: 20.h,
                    child: InkWell(
                      onTap: pickBackImage,
                      child: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.kWhite,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 8.w),
                          child: SvgPicture.asset(
                            AppIcons.kWhiteEditIcon,
                            width: 16.w,
                            height: 16.h,
                            color: AppColor.kGrayscale30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 327.w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Name',
                style: appTextStyle.kBMediumMedium.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              PrimaryTextFormField(
                  borderRadius: BorderRadius.circular(24.r),
                  hintText: 'Khalid Mohammed',
                  controller: emailC,
                  width: 327.w,
                  height: 52.h),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Email',
                style: appTextStyle.kBMediumMedium.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              PrimaryTextFormField(
                  borderRadius: BorderRadius.circular(24.r),
                  hintText: 'Khaledmohammed@gmail.com',
                  controller: emailC,
                  width: 327.w,
                  height: 52.h),
              SizedBox(
                height: 16.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Country',
                    style: appTextStyle.kBMediumMedium.copyWith(
                        color: AppColor.kGrayscaleDark100,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    width: 327.w,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(
                              Icons.list,
                              size: 16,
                              color: AppColor.kGrayscale40,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              child: Text(
                                'Select Item',
                                style: appTextStyle.kBMediumMedium
                                    .copyWith(color: AppColor.kGrayscale40),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: countriesName
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: appTextStyle.kBMediumMedium.copyWith(
                                        color: AppColor.kGrayscaleDark100,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value as String;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50.h,
                          width: 320.w,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: AppColor.kLine),
                            color: AppColor.kBackground2,
                          ),
                          elevation: 0,
                        ),
                        iconStyleData: IconStyleData(
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                            iconSize: 14,
                            iconEnabledColor: AppColor.kPrimary,
                            iconDisabledColor: AppColor.kPrimary),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200.h,
                          width: 326.w,
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColor.kBackground2,
                          ),
                          elevation: 0,
                          offset: const Offset(1, -5),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: Radius.circular(12.r),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 12, right: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Phone Number',
                style: appTextStyle.kBMediumMedium.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              PrimaryTextFormField(
                  borderRadius: BorderRadius.circular(24.r),
                  hintText: '+62 3712 3789 542',
                  controller: emailC,
                  width: 327.w,
                  height: 52.h),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Address',
                style: appTextStyle.kBMediumMedium.copyWith(
                    color: AppColor.kGrayscaleDark100,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              PrimaryTextFormField(
                  borderRadius: BorderRadius.circular(24.r),
                  hintText: '+62 3712 3789 542',
                  controller: emailC,
                  width: 327.w,
                  maxLines: 5,
                  height: 132.h),
              SizedBox(
                height: 32.h,
              ),
              PrimaryButton(
                elevation: 0,
                onTap: () {
                  // Get.off(() => const LandingScreen());
                  Get.back<void>();
                },
                text: 'Save Changes',
                bgColor: AppColor.kPrimary,
                borderRadius: 20.r,
                height: 46.h,
                width: 327.w,
                textColor: AppColor.kWhite,
                fontSize: 15.sp,
              ),
              SizedBox(
                height: 47.h,
              ),
            ]),
          )
        ]),
      ),
    );
  }

  Future<void> pickBackImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        backImage = File(pickedImage.path);
      });
    }
  }

  Future<void> pickFrontImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        frontImage = File(pickedImage.path);
      });
    }
  }
}
