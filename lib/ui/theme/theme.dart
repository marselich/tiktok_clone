import 'package:flutter/material.dart';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00ea4359)),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white38,
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedLabelStyle: TextStyle(fontSize: 12),
  ),
  splashFactory: InkRipple.splashFactory,
  highlightColor: Colors.transparent,
  splashColor: Colors.black,
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  useMaterial3: true,
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(
        const Size.fromHeight(50),
      ),
    ),
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
);
