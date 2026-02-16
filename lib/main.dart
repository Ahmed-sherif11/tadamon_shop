import 'package:tadamon_shop/features/product_details/presentation/view/product_details_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'features/cart/view/cart_view.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [Locale('ar', 'EG')], 
  locale: const Locale('ar', 'EG'),
      theme: ThemeData(fontFamily: 'Cairo'),
    
      home: const ProductDetailsView(), 
    );
  }
}