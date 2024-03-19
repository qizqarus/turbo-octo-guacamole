import 'package:flutter/material.dart';
// final theme = Theme.of(context).textTheme;

final lightTheme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      color: Color.fromRGBO(115, 115, 115, 1),
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 15,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.grey[800],
    unselectedItemColor: Colors.grey[500],
    backgroundColor: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Colors.black),
);
