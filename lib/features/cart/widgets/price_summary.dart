import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        _buildPriceRow("المجموع الفرعي", "120.00 دولاراً"),
        const SizedBox(height: 10),
        _buildPriceRow("الشحن", "مجاناً"),
        const SizedBox(height: 10),
        _buildPriceRow("الخصم", "- 10.00 دولاراً"),
        
        const Divider(height: 30, thickness: 1), 

        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             
            const Text(
              "الإجمالي",
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: Color(0xff2D6A4F), 
              ),
            ),
            
            const Text(
              "110.00 دولاراً",
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceRow(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
       
        Text(price, style: const TextStyle(color: Colors.black, fontSize: 14)),
      ],
    );
  }
}