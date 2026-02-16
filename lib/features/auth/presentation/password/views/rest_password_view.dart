import 'package:flutter/material.dart';
import '../widgets/reset_password_view_body.dart';

class RestPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: ResetPasswordViewBody()),
    );
  }
}
