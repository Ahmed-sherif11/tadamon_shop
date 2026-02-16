import 'package:flutter/material.dart';
import '../data/cart_model.dart'; 

class CartItem extends StatelessWidget {
  final CartProductModel product; 
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItem({
    super.key,
    required this.product, 
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(product.image, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, fontFamily: 'Cairo')
                ),
                Text(
                  "الحجم : ${product.size}", 
                  style: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: 'Cairo')
                ),
              ],
            ),
          ),
          _buildCounter(),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5), 
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onIncrement, 
            child: _buildIcon(Icons.add),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), 
            child: Text('${product.quantity}', style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          GestureDetector(
            onTap: onDecrement,
            child: _buildIcon(Icons.remove),
          ), 
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) => Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.white, 
          shape: BoxShape.circle
        ),
        child: Icon(icon, size: 16, color: Colors.black87),
      );
}