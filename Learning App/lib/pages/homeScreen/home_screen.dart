import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnkuy/data/const.dart';
import 'package:learnkuy/data/helper/countries_list.dart';
import 'package:learnkuy/general_widgets/custom_carousel_slider.dart';
import 'package:learnkuy/general_widgets/customtrack_shape.dart';
import 'package:learnkuy/general_widgets/primary_button.dart';
import 'package:learnkuy/general_widgets/primarytextbutton.dart';
import 'package:learnkuy/models/county_list_model.dart';
import 'package:learnkuy/models/user_model.dart';
import 'package:learnkuy/pages/homeScreen/widgets/countryinfogrid.dart';
import 'package:learnkuy/general_widgets/custom_appbar.dart';
import 'package:learnkuy/pages/homeScreen/widgets/lessonrow_widget.dart';
import 'package:learnkuy/pages/quizScreen/quiz_screen.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppTextStyle appTextStyle = AppTextStyle();
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        profileImage: currentUser.profileImage,
        name: currentUser.name,
        address: currentUser.address,
        appTextStyle: appTextStyle,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 35.h,
          ),
          CustomCarouselSlider(
              appTextStyle: appTextStyle,
              carouselController: carouselController),
          SizedBox(
            height: 24.h,
          ),
          LessonsRow(appTextStyle: appTextStyle),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: countriesList.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.w, right: 23.w),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.w,
                crossAxisSpacing: 12.h,
                childAspectRatio: 0.96,
              ),
              itemBuilder: (context, index) {
                CountriesList countries = countriesList[index];
                return InkWell(
                  onTap: () {
                    // print(
                    //     'send to quiz screen country name ${countries.name.split('_')[0].toString()}');
                    Get.to(() => QuizScreen(
                          countryName: countries.name.split('_')[0].toString(),
                        ));
                  },
                  child: CountryInfoGrid(
                      countries: countries, appTextStyle: appTextStyle),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
