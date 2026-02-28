import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; 
import 'package:tadamon_shop/features/donations/presentation/views/donation_view.dart';

import 'generated/l10n.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  try {
    
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
