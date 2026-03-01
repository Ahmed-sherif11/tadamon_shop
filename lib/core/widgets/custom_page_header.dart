import 'package:flutter/material.dart';
import '../theme/app_styles.dart';

class CustomPageHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const CustomPageHeader({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.textStyle20Bold),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(subtitle!,
              style: AppStyles.textStyle16Regular.copyWith(color: Colors.grey)),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}
