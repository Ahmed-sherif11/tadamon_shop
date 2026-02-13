import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; 
import 'package:tadamon_shop/features/cart/view/cart_view.dart';

class BottomAddToCart extends StatelessWidget {
  final double totalPrice;

  const BottomAddToCart({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F1), 
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "${totalPrice.toStringAsFixed(2)} دولاراً",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 13, 
                    fontFamily: 'Cairo'
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "تمت إضافة المنتج بنجاح!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green, 
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartView()),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF388E3C), 
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "إضافة إلى السلة",
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold, 
                      fontFamily: 'Cairo'
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}