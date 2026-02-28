import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"name": "أثاث", "icon": Icons.chair_outlined},
      {"name": "ديكور", "icon": Icons.eco_outlined},
      {"name": "إضاءة", "icon": Icons.light_outlined},
      {"name": "ملابس", "icon": Icons.checkroom_outlined},
      {"name": "مطبخ", "icon": Icons.kitchen_outlined},
      {"name": "حمام", "icon": Icons.bathtub_outlined},
    ];

    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text(categories[index]['name'], style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                Icon(categories[index]['icon'], size: 18),
              ],
            ),
          );
        },
      ),
    );
  }
}