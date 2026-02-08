import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/auth/presentation1/widgets/verify_email.body.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: VerifyEmailBody(),
      ),
    );
  }
}
