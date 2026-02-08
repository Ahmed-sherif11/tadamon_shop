import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/auth/presentation2/widgets/reset_password_view_body.dart';
import 'package:tadamon_shop/features/auth/presentation2/widgets/reset_password_view_body.dart';

class RestPasswordView extends StatelessWidget {
  const RestPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      body: Stack(
        children: [
          // الخلفية الخضراء
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFA5D6A7), Color(0xFFE8F5E9)],
              ),
            ),
          ),
          // محتوى الصفحة
          const ResetPasswordViewBody(),
        ],
      ),
    );
  }
}
