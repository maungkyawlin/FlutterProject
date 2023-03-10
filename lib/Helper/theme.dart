import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF4e5ae8);
const Color white = Colors.white;
const Color pinkColor = Color(0xFFff4667);
const Color yellowColor = Color(0xFFFFB746);
const Color darkGreyColor = Color(0xFF121212);
const Color darkHeaderColor = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    colorScheme: const ColorScheme.light(
        primary: primaryColor,
        brightness: Brightness.light,
        background: Colors.white),
  );

  static final dark = ThemeData(
      colorScheme: const ColorScheme.dark(
    primary: primaryColor,
    brightness: Brightness.dark,
    background: darkGreyColor,
  ));
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get dateForStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700]));
}
