import 'package:flutter/material.dart';
import '../widgets/reset_password_view_body.dart';

class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // تحديد الدرجة الغامقة الموحدة للتطبيق
    const Color mainBackgroundColor = Color(0xFFEDF1F3);

    return Scaffold(
      // 1. توحيد خلفية الـ Scaffold
      backgroundColor: mainBackgroundColor,
      body: Stack(
        children: [
          // 2. إضافة الإطار الأخضر مع ميزة الدمج (Blending)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Blur.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              // دمج لون الخلفية مع بياض الصورة لتبدو خلفية واحدة
              color: mainBackgroundColor,
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // 3. المحتوى الأساسي (SafeArea)
          const SafeArea(
            child: ResetPasswordViewBody(),
          ),
        ],
      ),
    );
  }
}
