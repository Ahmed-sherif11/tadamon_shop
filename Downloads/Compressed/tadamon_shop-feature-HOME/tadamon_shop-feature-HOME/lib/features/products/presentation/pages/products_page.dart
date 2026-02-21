import 'package:flutter/material.dart';
import '../views/products_view.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, 
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "منتجات",
            style: TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.w900, 
              fontSize: 20, 
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 22),
            onPressed: () {
            
              Navigator.pop(context);
            },
          ),
        ),
        body: const ProductsView(),
      ),
    );
  }
}