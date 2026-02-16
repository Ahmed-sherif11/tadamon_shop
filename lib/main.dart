import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // استيراد المكتبة
import 'package:tadamon_shop/features/donations/presentation/views/donation_view.dart';

import 'generated/l10n.dart';

void main() async {
  // 1. السطر ده لازم يكون أول سطر في الـ main عشان التهيئة
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // 2. تحميل ملف الـ .env (تأكد أن d صغيرة)
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint(
        "تحذير: لم يتم العثور على ملف .env، سيتم استخدام القيم الافتراضية.");
  }

  runApp(const TadamonApp());
}

class TadamonApp extends StatelessWidget {
  const TadamonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tadamon Shop',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DonationView(),
    );
  }
}
