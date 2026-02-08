import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        const Text("مقاس", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
        const SizedBox(height: 12),
        Container(
          width: double.infinity, 
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F8F1), 
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(child: _buildSizeItem("كبير", false)),
              Expanded(child: _buildSizeItem("متوسط", true)), 
              Expanded(child: _buildSizeItem("صغير", false)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizeItem(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isSelected 
          ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2, offset: const Offset(0, 2))] 
          : [],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.black : const Color(0xFF2E7D32),
          ),
        ),
      ),
    );
  }
}