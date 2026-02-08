import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/auth/presentation2/views/rest_password_view.dart';
import 'package:tadamon_shop/features/auth/presentation3/views/rest_password_success_view.dart';
import 'package:tadamon_shop/features/auth/presentation4/views/success_final_view.dart';
// استيراد الصفحة النهائية بناءً على تقسيمك الأخير في presentation3

void main() {
  runApp(const TadamunApp());
}

class TadamunApp extends StatelessWidget {
  const TadamunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tadamun App',
      // الاتجاه من اليمين لليسار ليناسب واجهة التطبيق العربية
      locale: const Locale('ar', 'EG'),
      theme: ThemeData(
        fontFamily:
            'Cairo', // تأكد من إضافة الخط في pubspec.yaml ليتطابق مع Figma
        scaffoldBackgroundColor: const Color(0xFFE8F5E9),
      ),
      // عرض الصفحة النهائية للنجاح
      home: const ResetPasswordSuccessView(),
    );
  }
}
