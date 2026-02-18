import 'package:flutter/material.dart';
import '../views/home_view.dart';
import '../../../products/presentation/pages/products_page.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final Color figmaGreen = const Color(0xFF618561);

  final List<Widget> _pages = [
    const HomeView(),
    const ProductsPage(), 
    const Center(child: Text("سلة المشتريات")),
    const Center(child: Text("الملف الشخصي")),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _selectedIndex == 0 
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "تضامن",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              // تم حذف leading من هنا لترحيل الأيقونة من اليمين
              actions: [
                // تم وضع السلة هنا في الـ actions لتظهر على الشمال
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            )
          : null, 
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: figmaGreen,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "فئات"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "سلة المشتريات"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "الملف الشخصي"),
          ],
        ),
      ),
    );
  }
}