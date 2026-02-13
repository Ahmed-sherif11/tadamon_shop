// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tadamon_app/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:tadamon_app/l10n/app_localizations.dart';
import 'package:tadamon_app/features/auth/presentation/pages/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  // إضافة Controllers للتحكم في الحقول وقراءة النصوص منها
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool _isRem = false, _obscure = true;
  bool _isLoading = false;

  Color primary = const Color(0xFF3FB56C),
      gray = const Color(0xFF777777),
      bgColor = const Color(0xFFF0F8FF);

  // دالة للتحقق من صيغة البريد الإلكتروني
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // تحديث دالة الـ Future مع إضافة شروط التحقق
  Future<void> _handleLogin(AppLocalizations l) async {
    String email = _emailController.text.trim();
    String password = _passController.text.trim();

    // 1. التحقق من الحقول الفارغة
    if (email.isEmpty || password.isEmpty) {
      _showSnackBar(
          isAr(context) ? "يرجى ملء جميع الحقول" : "Please fill all fields",
          Colors.red);
      return;
    }

    // 2. التحقق من صيغة الإيميل
    if (!_isValidEmail(email)) {
      _showSnackBar(
          isAr(context)
              ? "صيغة البريد الإلكتروني غير صحيحة"
              : "Invalid email format",
          Colors.orange);
      return;
    }

    // 3. التحقق من طول كلمة المرور (مثلاً لا تقل عن 6 خانات)
    if (password.length < 6) {
      _showSnackBar(
          isAr(context) ? "كلمة المرور ضعيفة جداً" : "Password is too short",
          Colors.orange);
      return;
    }

    // إذا اجتازت البيانات كل الشروط، نبدأ التحميل
    setState(() => _isLoading = true);

    try {
      // محاكاة الاتصال بالسيرفر
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        _showSnackBar(
            isAr(context) ? "تم تسجيل الدخول بنجاح" : "Login Successful",
            primary);
        // Navigator.pushReplacement(...)
      }
    } catch (e) {
      _showSnackBar(
          isAr(context) ? "فشل الاتصال" : "Connection failed", Colors.red);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
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
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
            child: Column(children: [
          CustomPaint(
              size: const Size(double.infinity, 180), painter: HeaderPainter()),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [
                Text(l.ti,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal')),
                const SizedBox(height: 32),
                Text(l.sub,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        color: gray,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal')),
                const SizedBox(height: 16),
                // تمرير الـ Controllers للحقول
                _field(Icons.email_outlined, l.em, false, currentIsAr,
                    _emailController),
                _field(Icons.lock_outline, l.ps, true, currentIsAr,
                    _passController),
                _remRow(l),
                _btn(l.btn, primary, l),
                _div(l),
                _social(l.go, "assets/images/google.png"),
                const SizedBox(height: 8),
                _social(l.fb, "assets/images/facebook.png"),
                const SizedBox(height: 16),
                _footer(l),
              ]))
        ])),
      ),
    );
  }

  // تحديث الـ Widget ليقبل Controller
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen()),
              );
            },
            child: Text(l.fg,
                style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal'))),
      ]);

  Widget _btn(String t, Color c, AppLocalizations l) => SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          onPressed: _isLoading ? null : () => _handleLogin(l),
          style: ElevatedButton.styleFrom(
              backgroundColor: c,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: _isLoading
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
                color: Colors.grey)),
      ]);
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF2E7D32).withOpacity(0.5),
            const Color(0xFF3FB56C).withOpacity(0.5)
          ]).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    Path path = Path()
      ..lineTo(0, size.height * 0.6)
      ..cubicTo(size.width * 0.25, size.height * 0.85, size.width * 0.75,
          size.height * 0.85, size.width, size.height * 0.6)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(old) => false;
}
