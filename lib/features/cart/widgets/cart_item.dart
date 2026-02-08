import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String title, size, image, price;
  
  const CartItem({
    super.key, 
    required this.title, 
    required this.size, 
    required this.image, 
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          _buildCounter(),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end, 
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text("الحجم : $size", style: const TextStyle(color: Colors.grey, fontSize: 11)),
                ],
              ),
              const SizedBox(width: 12),
              Image.asset(image, width: 45, height: 45),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5), 
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _buildIcon(Icons.remove),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), 
            child: Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          _buildIcon(Icons.add),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) => Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.white, 
          shape: BoxShape.circle
        ),
        child: Icon(icon, size: 14, color: Colors.black87),
      );
}