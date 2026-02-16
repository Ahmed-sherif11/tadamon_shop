import 'package:flutter/material.dart';

class SimilarItemsList extends StatelessWidget {
  const SimilarItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "تمت مشاهدتها مؤخراً",
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16, 
            fontFamily: 'Cairo', 
            color: Colors.black
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220, 
          child: Directionality(
            textDirection: TextDirection.rtl, 
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCard("ساعة كرونوغراف فاخرة", "499.99", "assets/images/pic4.jpg"),
                _buildCard("محفظة جلدية", "79.99", "assets/images/pic5.jpg"),
                _buildCard("نظارة عصرية", "29.99", "assets/images/pic6.jpg"),
                const SizedBox(width: 16), 
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String name, String price, String path) {
    return Container(
      width: 150, 
      margin: const EdgeInsets.only(left: 16), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12), 
            child: Image.asset(
              path,
              height: 150, 
              width: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[200],
                height: 150,
                child: const Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            maxLines: 1, 
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Cairo'
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "$price دولاراً",
            style: const TextStyle(
              color: Color(0xFF2E7D32), 
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Cairo'
            ),
          ),
        ],
      ),
    );
  }
}