import 'package:flutter/material.dart';

class ColorOptions extends StatelessWidget {
  const ColorOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, 
      children: [
        _buildCircle(Colors.grey, false),
        const SizedBox(width: 12),
        _buildCircle(Colors.white, true), 
        const SizedBox(width: 12),
        _buildCircle(Colors.black, false),
      ],
    );
  }

  Widget _buildCircle(Color color, bool isSelected) {
    return Container(
      width: 28, height: 28,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF2E7D32) : Colors.grey[300]!,
          width: 2,
        ),
      ),
    );
  }
}