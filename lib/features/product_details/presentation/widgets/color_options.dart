import 'package:flutter/material.dart';

class ColorOptions extends StatefulWidget {
  const ColorOptions({super.key});

  @override
  State<ColorOptions> createState() => _ColorOptionsState();
}

class _ColorOptionsState extends State<ColorOptions> {
  Color selectedColor = Colors.black; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, 
      children: [
        _buildCircle(Colors.grey),
        const SizedBox(width: 12),
        _buildCircle(Colors.white),
        const SizedBox(width: 12),
        _buildCircle(Colors.black), 
      ],
    );
  }

  Widget _buildCircle(Color color) {
    bool isSelected = selectedColor == color;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 40, 
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFF2E7D32) : Colors.grey[300]!,
            width: isSelected ? 2.5 : 1,
          ),
          boxShadow: isSelected 
              ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)] 
              : [],
        ),
      ),
    );
  }
}