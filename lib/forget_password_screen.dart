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
  void _handleResetPassword(AppLocalizations l) {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l.forgot_sub,
            style: const TextStyle(
                fontFamily: 'Tajawal', fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(Localizations.localeOf(context).languageCode == 'ar'
              ? "تم إرسال الرابط"
              : "Reset link sent"),
          backgroundColor: primaryColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 1. استدعاء المترجم
    var l = AppLocalizations.of(context)!;
    // 2. التحقق من اللغة الحالية
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
                      const SizedBox(height: 12),
                      Column(
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
                            style: const TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFF9F9F9),
                              prefixIcon: Icon(Icons.email_outlined,
                                  color: primaryColor),
                              hintText: "example@gmail.com",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () => _handleResetPassword(l),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 2,
                          ),
                          child: Text(
                            l.reset_btn,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                        ),
                      ),
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
}
