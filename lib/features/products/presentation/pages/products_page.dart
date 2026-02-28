import 'package:flutter/material.dart';
// تأكدي إن المسار ده بيشاور على ملف الـ HomePage في مشروعك
import 'package:tadamon_shop/features/home/presentation/pages/home_page.dart'; 
import '../views/products_view.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لضمان اتجاه السهم والكلام للعربي
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
          // السهم اللي جمب كلمة منتجات يوديكي للرئيسية
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 22),
            onPressed: () {
              // الكود ده هيقفل صفحة المنتجات ويرجعك فوراً لصفحة الـ HomePage
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            },
          ),
        ),
        // عرض محتويات صفحة المنتجات (البحث، الفلاتر، والشبكة)
        body: const ProductsView(),
      ),
    );
  }
}