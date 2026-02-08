import 'package:flutter/material.dart';
import 'login_button.dart';

class SuccessFinalViewBody extends StatelessWidget {
  const SuccessFinalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // أيقونة النجاح (الدائرة الخضراء)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFA5D6A7), width: 2),
                ),
                child: const Icon(
                  Icons.check,
                  color: Color(0xFF4CAF50),
                  size: 50,
                ),
              ),
              const SizedBox(height: 25),
              // العنوان
              const Text(
                "تم الانتهاء بنجاح",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 15),
              // النص الوصفي
              const Text(
                "تهانينا! كلمة المرور الخاصة بك تم تغييرها. للمتابعة، اضغط على تسجيل الدخول.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 30),
              // زر تسجيل الدخول
              LoginButton(onPressed: () {
                // منطق الرجوع لصفحة الـ Login الأساسية
              }),
            ],
          ),
        ),
      ),
    );
  }
}
