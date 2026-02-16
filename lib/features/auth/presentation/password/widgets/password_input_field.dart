import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final String label;
  PasswordInputField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: true,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: "********",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
