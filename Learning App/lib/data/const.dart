import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnkuy/pages/calendarScreen/calendar_screen.dart';
import 'package:learnkuy/pages/homeScreen/home_screen.dart';
import 'package:learnkuy/pages/profileScreen/profile_screen.dart';
import 'package:learnkuy/pages/progressScreen/progress_screen.dart';
import 'package:learnkuy/utils/colors.dart';

SystemUiOverlayStyle registerOverlay = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: AppColor.kBackground,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.dark,
);

List<Widget> pages = [
  const HomeScreen(),
  const CalenderScreen(),
  const ProgressScreen(),
  ProfileScreen(),
];

String termText =
    "I had an amazing experience at this barbershop! My barber was attentive to my needs and gave me a haircut that exceeded my expectations. He also gave me some great styling tips that I've been using ever since.     You are responsible for maintaining the confidentiality of your account information and password, and you agree to notify us immediately if you suspect any unauthorized access to your account. We reserve the right to terminate or suspend your access to the app at any time without notice";
String serviceTermText =
    "Return and Refund Policy: We want you to be completely satisfied with your purchase, but we understand that sometimes things don't work out. If you are not happy with your purchase for any reason, you may return it within 14 days of receiving it for a full refund or exchange. To be eligible for a return, the item must be unused and in the same condition as you received it. Shipping costs for returns are the responsibility of the buyer, unless the item is defective or damaged upon receipt. If you receive a defective or damaged item, please contact us within 48 hours of receiving it and we will provide a replacement or a ";
