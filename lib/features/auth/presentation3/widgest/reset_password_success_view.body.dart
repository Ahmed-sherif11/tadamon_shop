import 'package:flutter/material.dart';
import 'confirm_button.dart';

class ResetPasswordSuccessViewBody extends StatelessWidget {
  const ResetPasswordSuccessViewBody({super.key});

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
              // أيقونة الرجوع جهة اليمين
              const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward, color: Colors.black),
              ),
              const SizedBox(height: 20),
              // العنوان
              const Text(
                "إعادة تعيين كلمة\nالمرور",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32)),
              ),
              const SizedBox(height: 15),
              // نص النجاح
              const Text(
                "تم إعادة تعيين كلمة مرورك بنجاح. انقر على \"تأكيد\" لتعيين كلمة مرور جديدة.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 30),
              // زر التأكيد
              ConfirmButton(onPressed: () {
                // الانتقال لصفحة تسجيل الدخول مثلاً
              }),
            ],
          ),
        ),
      ),
    );
  }
}
