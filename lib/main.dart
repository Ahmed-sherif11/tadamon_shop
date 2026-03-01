// ignore_for_file: undefined_hidden_name

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart'; // المكتبة المطلوبة
import 'package:tadamon_app/features/auth/presentation/pages/Home_screen.dart';
import 'package:tadamon_app/l10n/app_localizations.dart';
import 'package:tadamon_app/features/auth/presentation/pages/splash_screen.dart';
import 'package:tadamon_app/features/auth/presentation/pages/login_screen.dart'
    hide HomeScreen; // مسار اللوجين
import 'package:tadamon_app/features/home/presentation/pages/home_screen.dart';
import 'package:tadamon_app/logic/auth_bloc/auth_bloc.dart';
import 'package:tadamon_app/features/auth/auth_service.dart';

void main() async {
  // التأكد من تهيئة الإضافات قبل تشغيل التطبيق
  WidgetsFlutterBinding.ensureInitialized();

  // قراءة حالة تسجيل الدخول من الذاكرة
  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: const Locale('ar'),
        home: isLoggedIn ? const SplashScreen() : const LoginScreen(),
      ),
    );
  }
}
