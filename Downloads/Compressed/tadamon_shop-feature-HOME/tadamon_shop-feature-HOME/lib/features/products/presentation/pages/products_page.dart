import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/home/presentation/pages/home_page.dart';
// ignore: unused_import
import 'package:tadamon_shop/features/home/presentation/view/home_page.dart'; // تأكدي من مسار ملف الهوم عندك
import '../views/products_view.dart'; // تأكدي من مسار ملف البرودكت فيو

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضبط اتجاه السهم والنصوص للعربية
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
          // التعديل هنا: السهم هيرجعك لصفحة الهوم مباشرة
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 22),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            },
          ),
        ),
        body: const ProductsView(),
      ),
    );
  }
}