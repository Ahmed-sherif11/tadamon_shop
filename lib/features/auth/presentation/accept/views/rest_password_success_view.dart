import 'package:flutter/material.dart';
import '../widgest/reset_password_success_view.body.dart';

class RestPasswordSuccessView extends StatelessWidget {
  const RestPasswordSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    // تعريف اللون الموحد في متغير لاستخدامه في الخلفية وفي دمج الصورة
    const Color mainBackgroundColor = Color(0xFFEDF1F3);

    return Scaffold(
      // 1. جعل خلفية الشاشة بالكامل هي اللون الغامق
      backgroundColor: mainBackgroundColor,
      body: Stack(
        children: [
          // 2. الإطار الأخضر العلوي مع خاصية الدمج
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Blur.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              // التعديل المطلوب لتوحيد اللون:
              color: mainBackgroundColor,
              colorBlendMode:
                  BlendMode.darken, // يدمج بياض الصورة مع لون الخلفية الغامق
            ),
          ),

          // 3. المحتوى (الكارت الأبيض) فوق الطبقات السابقة
          const SafeArea(
            child: ResetPasswordSuccessViewBody(),
          ),
        ],
      ),
    );
  }
}
