import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/auth/presentation/about/widgets/verify_email.body.dart';

class VerifyEmailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: VerifyEmailBody(),
      ),
    );
  }
}
