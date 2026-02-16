import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String selectedSize = 'متوسط';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      height: 41, 
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF2EE), 
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: buildSizeButton('صغير')),
          Expanded(child: buildSizeButton('متوسط')),
          Expanded(child: buildSizeButton('كبير')),
        ],
      ),
    );
  }

  Widget buildSizeButton(String size) {
    bool isSelected = selectedSize == size;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        alignment: Alignment.center, 
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent, 
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected 
            ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] 
            : [],
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.black : const Color(0xFF8DA38F),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14, 
          ),
        ),
      ),
    );
  }
}