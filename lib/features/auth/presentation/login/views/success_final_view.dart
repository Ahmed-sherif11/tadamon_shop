import 'package:flutter/material.dart';
import '../widgets/success_final_view_body.dart';

class SuccessFinalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // جعل الـ Scaffold شفاف ليظهر التدرج اللوني في الـ Body
      backgroundColor: Colors.transparent,
      body: SuccessFinalViewBody(),
    );
  }
}
