import 'package:pokemon/core/resources/export.resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//the dark theme
ThemeData darkTheme = ThemeData(
  fontFamily: outfit,
  dialogTheme: const DialogThemeData(surfaceTintColor: Colors.transparent),
  textTheme: darkTextTheme,
  pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF0A1636),
    shadowColor: Colors.white.withOpacity(0.08),
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primary500,
  ),
  scaffoldBackgroundColor: const Color(0xFF0E0E0E),
  dividerColor: white,
  hoverColor: const Color(0xff151718),
  cardTheme: CardThemeData(
      color: const Color(0xff151718),
      shadowColor: const Color(0xffffffff).withOpacity(0.15)),
  primaryColor: primary500,
  indicatorColor: primary500,
  cardColor: primary500,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: primary500,
    primary: primary500,
    brightness: Brightness.dark,
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: primary500,
      labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: -0.2,
          fontStyle: FontStyle.normal,
          color: primary500),
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: secondary50,
              width: 0.5
          ),
          borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: secondary50,
            width: 0.5
          ),
          borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: offWhite, width: 0.5))),
);

TextTheme darkTextTheme = TextTheme(
  bodyLarge: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  ),
  displayLarge: TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  displayMedium: TextStyle(
    fontSize: 21.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  displaySmall: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  titleMedium: TextStyle(
    fontSize: 22,
    height: 1.25,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    color: white,
  ),
  titleLarge: TextStyle(
    fontSize: 19,
    height: 1.25,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    color: white,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    height: 1.6,
    color: white,
  ),
  labelLarge: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: const Color(0xff130E00),
  ),
);
