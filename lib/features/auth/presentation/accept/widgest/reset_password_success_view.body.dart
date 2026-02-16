import 'package:flutter/material.dart';
import '../../login/views/success_final_view.dart';
import 'confirm_button.dart';

class ResetPasswordSuccessViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 60),
          Text(
            "إعادة تعيين كلمة المرور",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32),
            ),
          ),
          SizedBox(height: 12),
          Text(
            "تم إعادة تعيين كلمة مرورك بنجاح. انقر على\n\"تأكيد\" لتعيين كلمة مرور جديدة.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          SizedBox(height: 32),
          ConfirmButton(
            text: "تأكيد",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SuccessFinalView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
