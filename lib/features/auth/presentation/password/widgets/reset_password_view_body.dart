import 'package:flutter/material.dart';
import 'password_input_field.dart';
import 'update_password_button.dart';

class ResetPasswordViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            "إعادة تعيين كلمة المرور",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32)),
          ),
          SizedBox(height: 12),
          Text(
            "أدخل كلمة المرور الجديدة مرتين. يجب أن تتكون كلمة المرور من 8 أحرف على الأقل",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
          ),
          SizedBox(height: 40),
          PasswordInputField(label: "كلمة المرور"),
          SizedBox(height: 20),
          PasswordInputField(label: "تأكيد كلمة المرور"),
          SizedBox(height: 40),
          UpdatePasswordButton(),
        ],
      ),
    );
  }
}
