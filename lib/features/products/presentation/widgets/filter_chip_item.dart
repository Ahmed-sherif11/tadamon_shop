import 'package:flutter/material.dart';

class FilterChipItem extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterChipItem({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83, 
      height: 32, 
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF618561) : const Color(0xFFEBF0EB),
        borderRadius: BorderRadius.circular(25), 
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 15, 
          fontWeight: FontWeight.w700, 
        ),
      ),
    );
  }
}