import 'package:flutter/material.dart';

class ExpandableSection extends StatelessWidget {
  final String title;
  final String content; 

  const ExpandableSection({
    super.key, 
    required this.title, 
    this.content = "سيتم إضافة تفاصيل لهذا القسم قريباً.", 
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          ExpansionTile(
            tilePadding: EdgeInsets.zero, 
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
            trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, left: 8, right: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    content, 
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 1, thickness: 0.8, color: Color(0xFFEEEEEE)),
        ],
      ),
    );
  }
}