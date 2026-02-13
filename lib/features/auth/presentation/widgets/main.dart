import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tadamon_app/l10n/app_localizations.dart';
import 'package:tadamon_app/features/auth/presentation/pages/splash_screen.dart';

void main() async {
  // 1. التأكد من تهيئة كل أدوات فلاتر قبل تشغيل التطبيق
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // إعدادات اللغات
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      // تحديد اللغة الافتراضية
      locale: const Locale('ar'),

      // نقطة الانطلاق
      home: const SplashScreen(),
    );
  }
}
