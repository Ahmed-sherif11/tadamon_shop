import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/auth/presentation3/widgest/reset_password_success_view.body.dart';
// تم تصحيح المسار هنا ليتوافق مع المجلدات
// ignore: depend_on_referenced_packages

class ResetPasswordSuccessView extends StatelessWidget {
  const ResetPasswordSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      body: Stack(
        children: [
          // الخلفية المتدرجة الخضراء في الأعلى
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFA5D6A7), Color(0xFFE8F5E9)],
              ),
            ),
          ),
          // استدعاء محتوى الصفحة
          const ResetPasswordSuccessViewBody(),
        ],
      ),
    );
  }
}
