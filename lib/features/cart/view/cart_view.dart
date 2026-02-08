import 'package:flutter/material.dart';
import '../widgets/cart_item.dart';
import '../widgets/price_summary.dart';
import '../widgets/checkout_button.dart';
import '../widgets/pro_code.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        title: const Text('سلة المشتريات', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CartItem(
              image: 'assets/images/pic1.jpg',
              title: 'تي شيرت من القطن المصري',
              size: 'M',
              price: '120.00',
            ),
            const CartItem(
              image: 'assets/images/pic2.jpg',
              title: 'جينز الكلاسيكي',
              size: '38',
              price: '150.00',
            ),
            const CartItem(
              image: 'assets/images/pic3.jpg', 
              title: 'أحذية الشحن السلة',
              size: '8',
              price: '160.00',
            ),
            const SizedBox(height: 20),
            const ProCodeWidget(),
            const SizedBox(height: 20),
            
            const PriceSummary(), 
            const SizedBox(height: 30),
            const CheckoutButton(),
          ],
          ),
        ),
      ),

     bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        
        selectedItemColor: Colors.black, 
        unselectedItemColor: Colors.grey,
        
        currentIndex: 2, 
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'فئات'),
          
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'سلة المشتريات'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'الملف الشخصي'),
        ],
      ),
    );
  }
}