import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static const TextStyle font18BoldBlack = TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black,
  );
  static const TextStyle font14BoldBlack = TextStyle(
    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black,
  );
  static const TextStyle font13BoldGreen = TextStyle(
    fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primaryGreen,
  );
  
  static TextStyle font13MediumGreen = const TextStyle(
    fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.primaryGreen,
  );
}