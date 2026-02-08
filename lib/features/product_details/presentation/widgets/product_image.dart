import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250, 
      color: Colors.black, 
      child: Image.asset(
        'assets/images/pic4.jpg',
        fit: BoxFit.cover, 
        alignment: Alignment.center, 
        filterQuality: FilterQuality.high, 
        isAntiAlias: true,
      ),
    );
  }
}