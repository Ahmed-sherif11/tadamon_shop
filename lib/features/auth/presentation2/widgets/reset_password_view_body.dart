import 'package:flutter/material.dart';
import 'password_input_field.dart';
import 'update_password_button.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.arrow_forward, color: Colors.black),
              const SizedBox(height: 20),
              const Text(
                "إعادة تعيين كلمة\nالمرور",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
              ),
              const SizedBox(height: 15),
              const Text(
                "أدخل كلمة المرور الجديدة مرتين، يجب أن تتكون كلمة المرور من 8 أحرف على الأقل",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 30),
              const PasswordInputField(label: "كلمة المرور"),
              const SizedBox(height: 20),
              const PasswordInputField(label: "تأكيد كلمة المرور"),
              const SizedBox(height: 30),
              UpdatePasswordButton(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}