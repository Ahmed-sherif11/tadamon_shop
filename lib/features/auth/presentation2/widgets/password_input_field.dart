import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final String label;
  const PasswordInputField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          obscureText: true,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.grey, size: 20),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
          ),
        ),
      ],
    );
  }
}