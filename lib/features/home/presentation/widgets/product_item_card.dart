import 'package:flutter/material.dart';
import '../../../../core/theme/app_styles.dart';

class ProductItemCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const ProductItemCard({
    super.key, 
    required this.title, 
    required this.price, 
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image, 
              height: 160, 
              width: 160, 
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: AppStyles.font14BoldBlack),
          Text(price, style: AppStyles.font13BoldGreen), 
        ],
      ),
    );
  }
}