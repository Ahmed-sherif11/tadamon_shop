import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// المسار الصحيح بناءً على اسم مشروعك في الصور
import 'package:tadamon_shop/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const TadamonApp());
}

class TadamonApp extends StatelessWidget {
  const TadamonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تضامن',
      debugShowCheckedModeBanner: false,
      // دعم اللغة العربية والاتجاه من اليمين لليسار
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      locale: const Locale('ar', 'AE'),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}