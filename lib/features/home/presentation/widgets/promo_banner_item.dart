import 'package:flutter/material.dart';

class PromoBannerItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  final double screenWidth;

  const PromoBannerItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    double itemWidth = screenWidth > 900 ? screenWidth * 0.31 : 280;

    return Container(
      width: itemWidth,
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              height: 160,
              width: itemWidth,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(
            subTitle,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
        ],
      ),
    );
  }
}