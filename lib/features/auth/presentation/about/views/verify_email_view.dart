import 'package:flutter/material.dart';
import '../widgets/verify_email.body.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFEDF1F3);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Blur.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              color: backgroundColor,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          const SafeArea(
            child: VerifyEmailBody(),
          ),
        ],
      ),
    );
  }
}
