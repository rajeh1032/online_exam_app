import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xffF9F9F9);
  static const Color gray = Color(0xff535353);
  static const Color red = Color(0xffCC1010);
  static const Color green = Color(0xff11CE19);
  static const Color lightBlue = Color(0xffEDEFF3);
  static const Color lightGreen = Color(0xffCAF9CC);
  static const Color lightRed = Color(0xffF8D2D2);
  static const MaterialColor blue = MaterialColor(0xff02369C, <int, Color>{
    10: Color(0xffccd7eb),
    20: Color(0xffABBCDE),
    30: Color(0xff809ACD),
    40: Color(0xff5679BD),
    50: Color(0xff2C58AC),
    0: Color(0xff02369C),
    60: Color(0xff022D82),
    70: Color(0xff012468),
    80: Color(0xff011B4E),
    90: Color(0xff011234),
    100: Color(0xff000B1F),
  });

  static const MaterialColor black = MaterialColor(0xff0F0F0F, <int, Color>{
    10: Color(0xffCFCFCF),
    20: Color(0xffAFAFAF),
    30: Color(0xff878787),
    40: Color(0xff5F5F5F),
    50: Color(0xff373737),
    0: Color(0xff0F0F0F),
    60: Color(0xff0D0D0D),
    70: Color(0xff0A0A0A),
    80: Color(0xff080808),
    90: Color(0xff050505),
    100: Color(0xff030303),
  });
}
