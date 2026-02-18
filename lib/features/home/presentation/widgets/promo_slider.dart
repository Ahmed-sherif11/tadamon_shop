import 'package:flutter/material.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> promos = [
      'assets/images/plante.jpg',
      'assets/images/sofa.jpg',
      'assets/images/chair2.jpg',
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: promos.length,
        itemBuilder: (context, index) => Container(
          width: 320,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(promos[index]), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}