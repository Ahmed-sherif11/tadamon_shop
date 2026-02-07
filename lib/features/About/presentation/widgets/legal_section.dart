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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _buildLegalItem(S.of(context).termsOfUse),
        _buildLegalItem(S.of(context).privacyPolicy),
      ],
    );
  }

  Widget _buildLegalItem(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(title, style: const TextStyle(color: Colors.grey)),
    );
  }
}
