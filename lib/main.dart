import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/auth/presentation/about/views/verify_email_view.dart';
// تأكد من المسار حسب ترتيب الفولدرات عندك

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo', // عشان الخط يطلع زي التصميم
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      // الصفحة اللي هيبدأ منها التطبيق
      home: VerifyEmailView(),
    );
  }
}
