// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:tadamon_app/l10n/app_localizations.dart';
import 'package:tadamon_app/features/auth/presentation/pages/login_screen.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  static const Color primaryColor = Color(0xFF3FB56C);

  void _goToLogin() {
    if (mounted) {
      // نستخدم pushAndRemoveUntil لضمان العودة للوجين وتنظيف الـ Stack
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var l = AppLocalizations.of(context)!;
    bool isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Directionality(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: _buildBg(child: _buildCard(context, l)),
      ),
    );
  }

  Widget _buildBg({required Widget child}) => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [primaryColor.withOpacity(0.2), Colors.white],
                stops: const [0.0, 0.4])),
        child: Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: child)),
      );

  Widget _buildCard(BuildContext context, AppLocalizations l) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 25)
            ]),
        child: Column(children: [
          const SizedBox(height: 20),
          _icon(),
          const SizedBox(height: 35),
          Text(l.success_ti,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF137D3A))),
          const SizedBox(height: 15),
          Text(l.success_sub,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 45),
          _btn(l),
          const SizedBox(height: 20),
        ]),
      );

  Widget _icon() => Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: primaryColor, width: 2)),
        child: const Icon(Icons.check, color: primaryColor, size: 55),
      );

  Widget _btn(AppLocalizations l) => SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: _goToLogin, // العودة لا تتم إلا عند الضغط هنا
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(l.back_login,
              style: const TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white)),
        ),
      );
}
