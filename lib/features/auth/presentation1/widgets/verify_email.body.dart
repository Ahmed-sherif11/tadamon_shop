import 'package:flutter/material.dart';
import 'otp_fields_item.dart';

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. الخلفية المتدرجة اللي فوق
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE8F5E9), // أخضر فاتح جداً
                Colors.white,
              ],
            ),
          ),
        ),
        // 2. محتوى الصفحة
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 100), // مسافة من فوق
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // السهم اللي في الجنب
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.arrow_forward, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'تحقق من بريدك\nالإلكتروني',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2DB361),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'أرسلنا رابط إعادة الضبط إلى ahmedsherif.com\nأدخل الرمز المكون من 5 أرقام المذكور في البريد الإلكتروني',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 30),
                    // مربعات الـ OTP
                    const OtpFieldsItem(),
                    const SizedBox(height: 30),
                    // زرار التحقق
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2DB361),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'التحقق من الرمز',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // إعادة إرسال الرمز
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("لم يصلك البريد الإلكتروني بعد؟ ",
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "إعادة إرسال الرمز",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF2DB361),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
