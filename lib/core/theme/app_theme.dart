import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  fontFamily: 'Cairo',
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.blackColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo',
    ),
    iconTheme: IconThemeData(color: AppColors.blackColor),
  ),
);
