import 'package:flutter/material.dart';
import 'otp_fields_item.dart';
import 'custom_verification_button.dart';

class VerifyEmailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          SizedBox(height: 40),
          Text(
            "تحقق من بريدك الإلكتروني",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32)),
          ),
          SizedBox(height: 16),
          Text(
            "أرسلنا رابط إعادة الضبط إلى ahmedsherif.com أدخل الرمز المكون من 5 أرقام المذكور في البريد الإلكتروني",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
          ),
          SizedBox(height: 32),
          OtpFieldsItem(),
          SizedBox(height: 32),
          CustomVerificationButton(),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("لم يصلك البريد الإلكتروني بعد؟ ",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
              TextButton(
                onPressed: () {},
                child: Text("إعادة إرسال الرمز",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
