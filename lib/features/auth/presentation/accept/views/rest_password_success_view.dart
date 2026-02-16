import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/auth/presentation/accept/widgest/reset_password_success_view.body.dart';

class RestPasswordSuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ResetPasswordSuccessViewBody(),
      ),
    );
  }
}
