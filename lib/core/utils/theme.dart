import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color blackColor = const Color(0xff242424);

  static ThemeData light = ThemeData(
    // ? FontFamily

    fontFamily: GoogleFonts.nunitoSans().fontFamily,

    // ? Elevated Buttons Style

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: blackColor,
        textStyle: TextStyle(
          color: whiteColor,
        ),
      ),
    ),

    // ? Appbars Style

    appBarTheme: AppBarTheme(
      foregroundColor: blackColor,
      backgroundColor: whiteColor,
      elevation: 0,
      titleTextStyle: GoogleFonts.gelasio(color: blackColor),
    ),

    // ? Scaffold background Color

    scaffoldBackgroundColor: whiteColor,

    // ? Floating action Buttons styles

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: blackColor,
      foregroundColor: whiteColor,
    ),
  );
}
