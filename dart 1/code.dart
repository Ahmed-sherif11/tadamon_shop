import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('أهلاً وسهلاً بك 👋', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
