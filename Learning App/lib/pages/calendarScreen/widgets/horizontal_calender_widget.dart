library horizontal_week_calendar;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:learnkuy/utils/colors.dart';
import 'package:learnkuy/utils/icons_path.dart';
import 'package:learnkuy/utils/typography.dart';

enum WeekStartFrom {
  Sunday,
  Monday,
}

class HorizontalWeekCalendar extends StatefulWidget {
  /// week start from [WeekStartFrom.Monday]
  final WeekStartFrom? weekStartFrom;

  ///get DateTime on date select
  final Function(DateTime)? onDateChange;

  ///get the list of DateTime on week change
  final Function(List<DateTime>)? onWeekChange;

  /// Active background color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeBackgroundColor;

  /// In-Active background color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final Color? inactiveBackgroundColor;

  /// Disable background color
  ///
  /// Default value [Colors.grey]
  final Color? disabledBackgroundColor;

  /// Active text color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeTextColor;

  /// In-Active text color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final Color? inactiveTextColor;

  /// Disable text color
  ///
  /// Default value [Colors.grey]
  final Color? disabledTextColor;

  /// Active Navigator color
  ///
  /// Default value [Theme.of(context).primaryColor]
  final Color? activeNavigatorColor;

  /// In-Active Navigator color
  ///
  /// Default value [Colors.grey]
  final Color? inactiveNavigatorColor;

  /// Month Color
  ///
  /// Default value [Theme.of(context).primaryColor.withOpacity(.2)]
  final Color? monthColor;

  /// Radius of the selected item
  final BorderRadius? borderRadius;
   

  const HorizontalWeekCalendar({
    super.key,
    this.onDateChange,
    this.onWeekChange,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.disabledBackgroundColor,
    this.activeTextColor = Colors.white,
    this.inactiveTextColor,
    this.disabledTextColor,
    this.activeNavigatorColor,
    this.inactiveNavigatorColor,
    this.monthColor,
    this.weekStartFrom = WeekStartFrom.Monday,
    this.borderRadius,
 
  });

  @override
  State<HorizontalWeekCalendar> createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  CarouselController carouselController = CarouselController();

  DateTime today = DateTime.now();
  DateTime selectedDate = DateTime.now();
  List<DateTime> currentWeek = [];
  int currentWeekIndex = 0;

  List<List<DateTime>> listOfWeeks = [];

  @override
  void initState() {
    initCalender();
    super.initState();
  }

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  initCalender() {
    // List<DateTime> minus3Days = [];
    // List<DateTime> add3Days = [];
    // for (int index = 0; index < 3; index++) {
    //   DateTime minusDate = today.add(Duration(days: -(index + 1)));
    //   minus3Days.add(minusDate);
    //   DateTime addDate = today.add(Duration(days: (index + 1)));
    //   add3Days.add(addDate);
    // }
    // currentWeek.addAll(minus3Days.reversed.toList());
    // currentWeek.add(today);
    // currentWeek.addAll(add3Days);
    // listOfWeeks.add(currentWeek);

    final date = DateTime.now();

    DateTime startOfCurrentWeek = widget.weekStartFrom == WeekStartFrom.Monday
        ? getDate(date.subtract(Duration(days: date.weekday - 1)))
        : getDate(date.subtract(Duration(days: date.weekday % 7)));

    currentWeek.add(startOfCurrentWeek);
    for (int index = 0; index < 6; index++) {
      DateTime addDate = startOfCurrentWeek.add(Duration(days: (index + 1)));
      currentWeek.add(addDate);
    }

    listOfWeeks.add(currentWeek);

    getMorePreviousWeeks();
  }

  getMorePreviousWeeks() {
    List<DateTime> minus7Days = [];
    DateTime startFrom = listOfWeeks.isEmpty
        ? DateTime.now()
        : listOfWeeks[currentWeekIndex].isEmpty
            ? DateTime.now()
            : listOfWeeks[currentWeekIndex][0];

    for (int index = 0; index < 7; index++) {
      DateTime minusDate = startFrom.add(Duration(days: -(index + 1)));
      minus7Days.add(minusDate);
    }
    listOfWeeks.add(minus7Days.reversed.toList());
    setState(() {});
  }

  onDateSelect(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.onDateChange?.call(selectedDate);
  }

  onBackClick() {
    carouselController.nextPage();
  }

  onNextClick() {
    carouselController.previousPage();
  }

  onWeekChange(index) {
    currentWeekIndex = index;
    currentWeek = listOfWeeks[currentWeekIndex];

    if (currentWeekIndex + 1 == listOfWeeks.length) {
      getMorePreviousWeeks();
    }

    widget.onWeekChange?.call(currentWeek);
    setState(() {});
  }

  // =================

  bool isNextDisabled() {
    return listOfWeeks[currentWeekIndex].last.isBefore(DateTime.now());
  }

  isCurrentYear() {
    return DateFormat('yyyy').format(currentWeek[0]) ==
        DateFormat('yyyy').format(today);
  }
final AppTextStyle appTextStyle = AppTextStyle();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var withOfScreen = MediaQuery.of(context).size.width;

    double boxHeight = withOfScreen / 7;

    return currentWeek.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              buildCalenderHeader(),
              const SizedBox(
                height: 12,
              ),
              CarouselSlider(
                carouselController: carouselController,
                items: [
                  if (listOfWeeks.isNotEmpty)
                    for (int ind = 0; ind < listOfWeeks.length; ind++)
                      Container(
                        height: boxHeight,
                        width: withOfScreen,
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            for (int weekIndex = 0;
                                weekIndex < listOfWeeks[ind].length;
                                weekIndex++)
                              Expanded(
                                child: GestureDetector(
                                  onTap: listOfWeeks[ind][weekIndex]
                                          .isBefore(DateTime.now())
                                      ? () {
                                          onDateSelect(
                                            listOfWeeks[ind][weekIndex],
                                          );
                                        }
                                      : null,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: widget.borderRadius,
                                      color: DateFormat('dd-MM-yyyy').format(
                                                  listOfWeeks[ind]
                                                      [weekIndex]) ==
                                              DateFormat('dd-MM-yyyy')
                                                  .format(selectedDate)
                                          ? widget.activeBackgroundColor ??
                                              theme.primaryColor
                                          : listOfWeeks[ind][weekIndex]
                                                  .isBefore(DateTime.now())
                                              ? widget.inactiveBackgroundColor ??
                                                  theme.primaryColor
                                                      .withOpacity(.2)
                                              : widget.disabledBackgroundColor ??
                                                  Colors.grey,
                                      border: Border.all(
                                        color: theme.scaffoldBackgroundColor,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          DateFormat(
                                            'EEE',
                                          ).format(
                                            listOfWeeks[ind][weekIndex],
                                          ),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            color: DateFormat('dd-MM-yyyy')
                                                        .format(listOfWeeks[ind]
                                                            [weekIndex]) ==
                                                    DateFormat('dd-MM-yyyy')
                                                        .format(selectedDate)
                                                ? widget.activeTextColor ??
                                                    Colors.white
                                                : listOfWeeks[ind][weekIndex]
                                                        .isBefore(
                                                            DateTime.now())
                                                    ? widget.inactiveTextColor ??
                                                        AppColor.kGrayscale40
                                                    : widget.disabledTextColor ??
                                                        AppColor.kGrayscale40,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          //  theme.textTheme.bodyLarge!
                                          //     .copyWith(
                                          //   color: DateFormat('dd-MM-yyyy')
                                          //               .format(listOfWeeks[ind]
                                          //                   [weekIndex]) ==
                                          //           DateFormat('dd-MM-yyyy')
                                          //               .format(selectedDate)
                                          //       ? widget.activeTextColor ??
                                          //           Colors.white
                                          //       : listOfWeeks[ind][weekIndex]
                                          //               .isBefore(
                                          //                   DateTime.now())
                                          //           ? widget.inactiveTextColor ??
                                          //               Colors.white
                                          //                   .withOpacity(.2)
                                          //           : widget.disabledTextColor ??
                                          //               Colors.white,
                                          // ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        FittedBox(
                                          child: Text(
                                              // "$weekIndex: ${listOfWeeks[ind][weekIndex] == DateTime.now()}",
                                              "${listOfWeeks[ind][weekIndex].day}",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                color: DateFormat('dd-MM-yyyy')
                                                            .format(listOfWeeks[
                                                                    ind]
                                                                [weekIndex]) ==
                                                        DateFormat('dd-MM-yyyy')
                                                            .format(
                                                                selectedDate)
                                                    ? widget.activeTextColor ??
                                                        AppColor
                                                            .kGrayscaleDark100
                                                    : listOfWeeks[ind]
                                                                [weekIndex]
                                                            .isBefore(
                                                                DateTime.now())
                                                        ? widget.inactiveTextColor ??
                                                            AppColor
                                                                .kGrayscaleDark100
                                                        : widget.disabledTextColor ??
                                                            AppColor
                                                                .kGrayscaleDark100,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              )
                                              // style: theme.textTheme.titleLarge!
                                              //     .copyWith(
                                              //   color:
                                              //   fontWeight: FontWeight.bold,
                                              // ),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                ],
                options: CarouselOptions(
                  scrollPhysics: const ClampingScrollPhysics(),
                  height: boxHeight,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  reverse: true,
                  onPageChanged: (index, reason) {
                    onWeekChange(index);
                  },
                ),
              ),
            ],
          );
  } Row buildCalenderHeader() {
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.kCalendar,
          width: 16.w,
          height: 16.w,
          color: AppColor.kGrayscaleDark100,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(DateFormat.yMMM().format(DateTime.now()),
            textAlign: TextAlign.center,
            style: appTextStyle.kBSmallSemiBold.copyWith(
              color: AppColor.kGrayscaleDark100,
            )),
      ],
    );
  }
}
