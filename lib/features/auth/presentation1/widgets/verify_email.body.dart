import 'package:flutter/material.dart';
// استدعاء ملفات الـ Theme باستخدام مسار المشروع الصحيح
import 'package:tadamon_shop/core/theme/app_styles.dart';
import 'package:tadamon_shop/core/theme/app_colors.dart';
// استدعاء الـ Widgets الموجودة في نفس المجلد
import 'otp_fields_item.dart';
import 'custom_verification_button.dart';

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية المتدرجة
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFC8E6C9).withOpacity(0.5),
                Colors.white,
              ],
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 100),
                // الكارت الأبيض المحتوي على العناصر
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "تحقق من بريدك الإلكتروني",
                        // تصحيح: AppStyles (بالـ s) و textStyle20
                        style: AppStyles.textStyle20.copyWith(
                          color: const Color(0xFF2D6A4F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "أرسلنا رابط إعادة الضبط إلى ahmedsherif.com\nأدخل الرمز المكون من 5 أرقام المذكور في البريد الإلكتروني",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey, height: 1.5, fontSize: 13),
                      ),
                      const SizedBox(height: 35),
                      // تصحيح: حذف كلمة const من هنا لأن الـ OTP يحتوي على TextField
                      OtpFieldsItem(),
                      const SizedBox(height: 35),
                      // زرار التحقق المخصص
                      CustomVerificationButton(
                        onPressed: () {
                          // أضف هنا كود الانتقال للصفحة التالية
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "لم يصلك البريد الإلكتروني بعد؟ إعادة إرسال الرمز",
                        style: TextStyle(
                            color: Color(0xFF2D6A4F),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
