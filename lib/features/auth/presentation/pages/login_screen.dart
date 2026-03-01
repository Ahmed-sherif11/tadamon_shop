// ignore_for_file: deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadamon_app/features/auth/presentation/pages/home_screen.dart';
import 'package:tadamon_app/logic/auth_bloc/auth_bloc.dart';
import 'package:tadamon_app/logic/auth_bloc/auth_event.dart';
import 'package:tadamon_app/logic/auth_bloc/auth_state.dart';
import 'package:tadamon_app/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:tadamon_app/l10n/app_localizations.dart';
import 'package:tadamon_app/features/auth/presentation/pages/register_screen.dart';
import 'package:tadamon_app/features/home/presentation/pages/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _isRem = false, _obscure = true;

  Color primary = const Color(0xFF3FB56C),
      gray = const Color(0xFF777777),
      bgColor = const Color(0xFFF0F8FF);

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _showSnackBar(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(msg, style: const TextStyle(fontFamily: 'Tajawal')),
          backgroundColor: color),
    );
  }

  bool isAr(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'ar';

  @override
  Widget build(BuildContext context) {
    var l = AppLocalizations.of(context)!;
    bool currentIsAr = isAr(context);

    return Directionality(
      textDirection: currentIsAr ? TextDirection.rtl : TextDirection.ltr,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            _showSnackBar(
                currentIsAr ? "تم تسجيل الدخول بنجاح" : "Login Successful",
                primary);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else if (state is AuthError) {
            _showSnackBar(state.message, Colors.red);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: bgColor,
            body: Stack(
              children: [
                // الطبقة الأولى: الكيرف (الخلفية العلوية)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/header_curve.png",
                    fit: BoxFit.fill,
                    height: 500,
                  ),
                ),

                // الطبقة الثانية: محتوى الصفحة
                Positioned.fill(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                            height:
                                150), // لضبط بداية الكلام فوق الكيرف [cite: 2026-02-28]
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            children: [
                              Text(l.ti,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      fontFamily: 'Tajawal')),
                              const SizedBox(height: 16),
                              Text(l.sub,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: gray,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Tajawal')),
                              const SizedBox(height: 32),
                              _field(Icons.email_outlined, l.em, false,
                                  currentIsAr, _emailController),
                              _field(Icons.lock_outline, l.ps, true,
                                  currentIsAr, _passController),
                              _remRow(l),
                              _btn(l.btn, primary, l, state),
                              _div(l),
                              _social(l.go, "assets/images/google.png"),
                              const SizedBox(height: 8),
                              _social(l.fb, "assets/images/facebook.png"),
                              const SizedBox(height: 16),
                              _footer(l),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _field(IconData i, String h, bool p, bool isAr,
          TextEditingController controller) =>
      Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: TextField(
              controller: controller,
              obscureText: p ? _obscure : false,
              textAlign: isAr ? TextAlign.right : TextAlign.left,
              style: const TextStyle(
                  fontFamily: 'Tajawal', fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                prefixIcon: Icon(i, color: const Color(0xFF444444)),
                suffixIcon: p
                    ? IconButton(
                        icon: Icon(
                            _obscure ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => setState(() => _obscure = !_obscure))
                    : null,
                hintText: h,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
              )));

  Widget _remRow(AppLocalizations l) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Checkbox(
              value: _isRem,
              activeColor: primary,
              onChanged: (v) => setState(() => _isRem = v!)),
          Text(l.rem,
              style: const TextStyle(
                  fontFamily: 'Tajawal', fontWeight: FontWeight.bold))
        ]),
        TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen())),
            child: Text(l.fg,
                style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal'))),
      ]);

  Widget _btn(String t, Color c, AppLocalizations l, AuthState state) {
    bool loading = state is AuthLoading;
    return SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
            onPressed: loading
                ? null
                : () {
                    String email = _emailController.text.trim();
                    String password = _passController.text.trim();
                    if (email.isEmpty || password.isEmpty) return;
                    context
                        .read<AuthBloc>()
                        .add(LoginRequested(email: email, password: password));
                  },
            style: ElevatedButton.styleFrom(
                backgroundColor: c,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: loading
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2))
                : Text(t,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal'))));
  }

  Widget _div(AppLocalizations l) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(children: [
        const Expanded(child: Divider(thickness: 1.5)),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(l.or,
                style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.bold,
                    color: gray))),
        const Expanded(child: Divider(thickness: 1.5))
      ]));

  Widget _social(String t, String img) => Container(
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFCCCCCC))),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(t,
            style: const TextStyle(
                fontFamily: 'Tajawal', fontWeight: FontWeight.bold)),
        const SizedBox(width: 12),
        Image.asset(img,
            height: 24, errorBuilder: (c, e, s) => const Icon(Icons.login))
      ]));

  Widget _footer(AppLocalizations l) =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (c) => const RegisterScreen())),
            child: Text(l.cr,
                style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal'))),
        Text(l.no,
            style: const TextStyle(
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
                color: Colors.grey))
      ]);
}
