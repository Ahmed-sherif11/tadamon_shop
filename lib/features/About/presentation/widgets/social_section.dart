import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // كلمة تواصل معنا في اليمين تماماً
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            S.of(context).contactUs,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
        const SizedBox(height: 15),

        // استخدام Center مع Padding لجعل المستطيل يحيط بالأيقونات فقط
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: 10, horizontal: 30), // مساحة صغيرة حول الأيقونات
            decoration: BoxDecoration(
              color: const Color(0xffF9F9F9)
                  .withValues(alpha: 0.8), // لون شفاف وواضح
              borderRadius:
                  BorderRadius.circular(20), // حواف دائرية تجعل شكله أرشق
            ),
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // أهم سطر: يجعل الـ Row يأخذ أقل مساحة ممكنة
              children: const [
                Icon(FontAwesomeIcons.facebook,
                    color: Color(0xff27AE60), size: 26),
                SizedBox(width: 20),
                Icon(FontAwesomeIcons.twitter,
                    color: Color(0xff27AE60), size: 26),
                SizedBox(width: 20),
                Icon(FontAwesomeIcons.instagram,
                    color: Color(0xff27AE60), size: 26),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
