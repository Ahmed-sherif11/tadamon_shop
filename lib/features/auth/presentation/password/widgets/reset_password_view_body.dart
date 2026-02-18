import 'package:flutter/material.dart';
import 'password_input_field.dart';
import 'update_password_button.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // مسافة لنزول الكارت عن أعلى الشاشة كما في التصميم
          const SizedBox(height: 150),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              // الكارت الأبيض اللي شايل البيانات
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
                    "إعادة تعيين كلمة المرور",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "أدخل كلمة المرور الجديدة مرتين. يجب أن تتكون كلمة المرور من 8 أحرف على الأقل",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14, color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 32),
                  PasswordInputField(label: "كلمة المرور"),
                  const SizedBox(height: 20),
                  PasswordInputField(label: "تأكيد كلمة المرور"),
                  const SizedBox(height: 32),
                  UpdatePasswordButton(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
