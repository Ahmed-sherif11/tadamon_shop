import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tadamon_shop/features/chatbot/presentation/views/chat_view.dart';
import 'package:tadamon_shop/features/about/presentation/views/about_view.dart';
import 'package:tadamon_shop/features/donations/presentation/views/donation_view.dart';

import 'generated/l10n.dart';

void main() {
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
      home: const DonationsView(),
    );
  }
}
