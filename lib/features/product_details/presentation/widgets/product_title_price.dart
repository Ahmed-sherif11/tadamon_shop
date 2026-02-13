import 'package:flutter/material.dart';

class ProductTitlePrice extends StatelessWidget {
  const ProductTitlePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        const Text(
          "ساعة كرونوغراف فاخرة",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            const SizedBox(width: 4),
            const Text("4.5", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            const Text(
              "(120 تقييم)",
              style: TextStyle(color: Color(0xFF2E7D32), fontSize: 12, fontFamily: 'Cairo'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          "499.99 دولاراً أمريكياً",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Text(
          "متوفر في المخزون",
          style: TextStyle(color: Color(0xFF2E7D32), fontSize: 12, fontFamily: 'Cairo'),
        ),
      ],
    );
  }
}