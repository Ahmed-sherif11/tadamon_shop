import 'package:flutter/material.dart';

class ExpandableSection extends StatelessWidget {
  final String title;
  const ExpandableSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.black54), 
          
          title: Text(
            title, 
            textAlign: TextAlign.right, 
            style: const TextStyle(
              fontFamily: 'Cairo', 
              fontSize: 15, 
              fontWeight: FontWeight.bold, 
              color: Colors.black, 
            ),
          ),
          contentPadding: EdgeInsets.zero,
        ),
        const Divider(height: 1, thickness: 0.8, color: Color(0xFFEEEEEE)), 
      ],
    );
  }
}