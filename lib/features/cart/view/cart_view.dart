import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import '../manager/cart_cubit.dart'; 
import '../data/cart_model.dart'; 
import '../widgets/cart_item.dart';
import '../widgets/price_summary.dart';
import '../widgets/checkout_button.dart';
import '../widgets/pro_code.dart';
class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int _currentIndex = 2; 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..loadCartItems(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color(0xffF8F8F8),
          appBar: AppBar(
            title: const Text(
              'سلة المشتريات',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: BlocBuilder<CartCubit, List<CartProductModel>>(
            builder: (context, cartItems) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: cartItems.map((product) {
                          return CartItem(
                            product: product, 
                            onIncrement: () => context.read<CartCubit>().incrementQuantity(product.id),
                            onDecrement: () => context.read<CartCubit>().decrementQuantity(product.id),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ProCodeWidget(),
                        const SizedBox(height: 15),
                        const PriceSummary(), 
                        const SizedBox(height: 15),
                        const CheckoutButton(),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: _currentIndex, 
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
            onTap: (index) {
              setState(() {
                _currentIndex = index; 
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'فئات'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'سلة المشتريات'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'الملف الشخصي'),
            ],
          ),
        ),
      ),
    );
  }
}