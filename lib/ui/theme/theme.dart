import 'package:flutter/material.dart';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00ea4359)),
  scaffoldBackgroundColor: Colors.black,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white38,
  ),
  splashFactory: InkRipple.splashFactory,
  highlightColor: Colors.transparent,
  splashColor: Colors.black,
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  useMaterial3: true,
  hintColor: Colors.white,
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    ),
  ),
);
