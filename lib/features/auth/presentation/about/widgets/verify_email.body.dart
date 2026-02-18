import 'package:flutter/material.dart';
import 'otp_fields_item.dart';
import 'custom_verification_button.dart';

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Text(
                    "تحقق من بريدك الإلكتروني",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "أرسلنا رابط إعادة الضبط إلى ahmedsherif.com أدخل الرمز المكون من 5 أرقام المذكور في البريد الإلكتروني",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  OtpFieldsItem(),
                  const SizedBox(height: 32),
                  CustomVerificationButton(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "لم يصلك البريد الإلكتروني بعد؟ ",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "إعادة إرسال الرمز",
                          style: TextStyle(
                            color: Color(0xFF4CAF50),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
