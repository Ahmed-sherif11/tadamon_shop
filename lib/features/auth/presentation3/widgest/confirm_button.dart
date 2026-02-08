import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ConfirmButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPressed,
        child: const Text(
          "تأكيد",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
