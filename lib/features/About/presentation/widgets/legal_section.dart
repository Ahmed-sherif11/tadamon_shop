import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class LegalSection extends StatelessWidget {
  const LegalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).legalInfo,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
        ),
        const SizedBox(height: 20),
        _buildLegalItem(
          context,
          S.of(context).termsOfUse,
          S.of(context).termsContent, // نستخدم الـ Key اللي في الـ l10n
        ),
        _buildLegalItem(
          context,
          S.of(context).privacyPolicy,
          S.of(context).privacyContent, // نستخدم الـ Key اللي في الـ l10n
        ),
      ],
    );
  }

  Widget _buildLegalItem(BuildContext context, String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20),
          trailing: const Icon(Icons.keyboard_arrow_down,
              size: 28, color: Color(0xffBDBDBD)),
          title: Text(
            title,
            style: const TextStyle(
                color: Color(0xffBDBDBD),
                fontFamily: 'Cairo',
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: Text(
                content,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 13,
                  color: Color(0xff757575),
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
