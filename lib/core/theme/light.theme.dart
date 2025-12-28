import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon/core/resources/export.resources.dart';

//the light theme
ThemeData lightTheme = ThemeData(
  fontFamily: outfit,
  dialogTheme: const DialogThemeData(surfaceTintColor: Colors.transparent),
  textTheme: lightTextTheme,
  pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
  primaryColor: primary800,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: primary800,
    primary: primary800,
    brightness: Brightness.light,
  ),
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: Colors.transparent),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          fontStyle: FontStyle.normal,
          // fontFamily: "",
          color: primary500),
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grayScale20,
          ),
          borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grayScale20,
          ),
          borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primary500))),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    minimumSize: const Size(double.maxFinite, 40),
    side: const BorderSide(color: primary500),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  )),
  appBarTheme: AppBarTheme(
    backgroundColor: offWhite,
    shadowColor: Colors.black.withOpacity(0.08),
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  dividerColor: black10,
  cardTheme:
      const CardThemeData(color: Color(0xffF5FCFE), shadowColor: Color(0xffD8D8D8)),
  hoverColor: const Color(0xFFE0E0E0).withOpacity(0.5),
  hintColor: primary500,
  indicatorColor: primary500,
  cardColor: primary500,
  scaffoldBackgroundColor: const Color(0xffFAFAFA),
  highlightColor: Colors.transparent,
  tabBarTheme: TabBarThemeData(
    labelStyle:
        TextStyle(fontSize: 14, color: const Color(0xff01061F)),
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    unselectedLabelColor: const Color(0xff444E54),
    unselectedLabelStyle: TextStyle(color: const Color(0xff444E54)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 16),
      backgroundColor: primary500,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      foregroundColor: Colors.white,
      minimumSize: const Size(double.maxFinite, 48),
    ),
  ),
);

TextTheme lightTextTheme = TextTheme(
  bodyLarge: TextStyle(
    fontFamily: outfit,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
  displayLarge: TextStyle(
    fontFamily: outfit,
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  displayMedium: TextStyle(
    fontFamily: outfit,
    fontSize: 21.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  ),
  displaySmall: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
  titleMedium: TextStyle(
    fontSize: 22,
    height: 1.25,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    color: primary500,
  ),
  titleLarge: TextStyle(
    fontSize: 19,
    height: 1.25,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    color: primary500,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    height: 1.6,
    color: offWhite,
  ),
  labelLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: const Color(0xff130E00),
  ),
);
