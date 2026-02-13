// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:tadamon_app/l10n/app_localizations.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  final Color primaryColor = const Color(0xFF3FB56C);
  final TextEditingController _emailController = TextEditingController();

  // إضافة متغير حالة التحميل
  bool _isLoading = false;

  // تحويل الدالة إلى Future
  Future<void> _handleResetPassword(AppLocalizations l) async {
    if (_emailController.text.isEmpty) {
      _showSnackBar(l.forgot_sub, Colors.red);
      return;
    }

    // بدء التحميل
    setState(() => _isLoading = true);

    try {
      // محاكاة عملية إرسال الإيميل عبر السيرفر (Future)
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        _showSnackBar(
          Localizations.localeOf(context).languageCode == 'ar'
              ? "تم إرسال رابط إعادة التعيين إلى بريدك الإلكتروني"
              : "Reset link sent to your email",
          primaryColor,
        );

        // العودة لصفحة تسجيل الدخول بعد النجاح بـ 2 ثانية
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) Navigator.pop(context);
      }
    } catch (e) {
      _showSnackBar("Error: $e", Colors.red);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnackBar(String message, Color bgColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: const TextStyle(
                fontFamily: 'Tajawal', fontWeight: FontWeight.bold)),
        backgroundColor: bgColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var l = AppLocalizations.of(context)!;
    bool isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Directionality(
      textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [primaryColor.withOpacity(0.2), Colors.white],
              stops: const [0.0, 0.4],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment:
                            isAr ? Alignment.topRight : Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                              isAr
                                  ? Icons.arrow_forward_ios
                                  : Icons.arrow_back_ios,
                              color: primaryColor,
                              size: 22),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Text(
                        l.forgot_ti,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal',
                          color: Color.fromARGB(255, 19, 139, 57),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        l.forgot_sub,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Tajawal',
                          color: Color.fromARGB(255, 107, 107, 107),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 25),
                      _buildEmailField(l, isAr),
                      const SizedBox(height: 35),
                      _buildResetButton(l),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(AppLocalizations l, bool isAr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.em,
          style: const TextStyle(
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w800,
            fontSize: 15,
            color: Color.fromARGB(255, 143, 142, 142),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
          textAlign: isAr ? TextAlign.right : TextAlign.left,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
              fontFamily: 'Tajawal', fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF9F9F9),
            prefixIcon: Icon(Icons.email_outlined, color: primaryColor),
            hintText: "example@gmail.com",
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResetButton(AppLocalizations l) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _isLoading ? null : () => _handleResetPassword(l),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
        ),
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                l.reset_btn,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Tajawal',
                ),
              ),
      ),
    );
  }
}
