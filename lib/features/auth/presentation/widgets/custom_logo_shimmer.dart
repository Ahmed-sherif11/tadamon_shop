// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors.dart';

class CustomLogoshimmer extends StatelessWidget {
  const CustomLogoshimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var shimmer;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 300,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 5),

        // تأثير اللمعان على كلمة "تضامن"
        shimmer.fromColors(
          baseColor: AppColors.primaryGreen,
          highlightColor: Colors.white.withOpacity(0.5),
          period: const Duration(seconds: 2),
          child: const Text(
            'تضامن',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      ],
    );
  }
}
