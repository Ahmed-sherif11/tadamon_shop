// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tadamon_app/l10n/app_localizations.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();

    // الانتظار لمدة 5 ثوانٍ ثم الانتقال لصفحة تسجيل الدخول
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => const LoginScreen()));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 2. استدعاء المترجم
    var l = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          _buildLogoAndText(l), // تمرير المترجم الجديد للدالة
          _buildShimmerLayer(),
        ]),
      ),
    );
  }

  Widget _buildLogoAndText(AppLocalizations l) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/logo.png',
              width: 300, height: 300, fit: BoxFit.contain),
          SizedBox(height: 0),
          Text(l.app_name,
              style: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF3FB56C))),
        ],
      );

  Widget _buildShimmerLayer() => Positioned.fill(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) => ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (rect) => LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                _controller.value - 0.2,
                _controller.value,
                _controller.value + 0.2
              ],
              colors: [
                Colors.white.withOpacity(0),
                Colors.white.withOpacity(0.6),
                Colors.white.withOpacity(0)
              ],
            ).createShader(rect),
            child: Container(color: Colors.white),
          ),
        ),
      );
}
