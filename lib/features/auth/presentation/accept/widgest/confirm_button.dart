import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/auth/presentation/login/views/success_final_view.dart';

class ConfirmButton extends StatelessWidget {
  ConfirmButton({this.onPressed, this.text});

  final VoidCallback? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4CAF50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed ??
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuccessFinalView()),
              );
            },
        child: Text(
          text ?? "تأكيد",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
