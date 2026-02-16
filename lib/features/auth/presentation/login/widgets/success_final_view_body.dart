import 'package:flutter/material.dart';
import 'login_button.dart';

class SuccessFinalViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // التدرج اللوني في الخلفية
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE8F5E9), Colors.white],
        ),
      ),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // الدائرة الخارجية الشفافة للأيقونة
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF4CAF50).withOpacity(0.1),
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape
                        .circle, // تم تصحيح النقطة هنا بدل الفاصلة المنقوطة
                    color: Color(0xFFE8F5E9),
                  ),
                  child: Icon(
                    Icons.check,
                    color: Color(0xFF4CAF50),
                    size: 40,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'تم الانتهاء بنجاح',
                style: TextStyle(
                  color: Color(0xFF2E7D32),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'تهانينا! كلمة المرور الخاصة بك تم تغييرها.\nللمتابعة، اضغط على تسجيل الدخول.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32),
              LoginButton(
                onPressed: () {
                  // هنا تقدري تضيفي كود الرجوع لأول صفحة في التطبيق
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
