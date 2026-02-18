import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/auth/presentation/login/views/success_final_view.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, this.onPressed, this.text});

  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed ??
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SuccessFinalView()),
              );
            },
        child: Text(
          text ?? "تأكيد",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
