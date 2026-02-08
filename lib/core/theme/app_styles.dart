import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppStyles {
  static const textStyle20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
    fontFamily: 'Cairo',
  );

  static const textStyle18SemiBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
    fontFamily: 'Cairo',
  );

  static const textStyle16Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.greyTextColor,
    fontFamily: 'Cairo',
  );

  static get textStyles20 => null;
}
