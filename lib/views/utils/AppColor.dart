import 'package:flutter/material.dart';

class AppColor {
  static Color primary = Color.fromARGB(255, 65, 106, 175);
  static Color primarySoft = Color.fromARGB(255, 65, 106, 175);
  static Color primaryExtraSoft = const Color(0xFFEEF4F4);
  static Color secondary = const Color(0xFFEDE5CC);
  static Color whiteSoft = const Color(0xFFF8F8F8);
  static LinearGradient bottomShadow = LinearGradient(colors: [
    Color.fromARGB(255, 43, 175, 203).withOpacity(0.2),
    Color.fromARGB(255, 43, 175, 203).withOpacity(0)
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static LinearGradient linearBlackBottom = LinearGradient(
      colors: [Colors.black.withOpacity(0.45), Colors.black.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static LinearGradient linearBlackTop = LinearGradient(
      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}
