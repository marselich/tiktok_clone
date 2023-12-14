import 'package:flutter/material.dart';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00ea4359)),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.white,
    color: Colors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    modalBackgroundColor: Color.fromARGB(255, 245, 245, 244),
    surfaceTintColor: Colors.transparent,
  ),
  dialogBackgroundColor: Colors.white,
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0.0,
    backgroundColor: Colors.black,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white38,
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedLabelStyle: TextStyle(fontSize: 12),
  ),
  splashFactory: InkRipple.splashFactory,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
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
  textTheme: TextTheme(
    labelLarge: const TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: Colors.black.withOpacity(0.3),
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  ),
);
