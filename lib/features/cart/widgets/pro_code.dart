import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/cart_cubit.dart';

class ProCodeWidget extends StatefulWidget {
  const ProCodeWidget({super.key});

  @override
  State<ProCodeWidget> createState() => _ProCodeWidgetState();
}

class _ProCodeWidgetState extends State<ProCodeWidget> {
  final TextEditingController _promoController = TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _promoController,
          textAlign: TextAlign.right, 
          decoration: InputDecoration(
            hintText: "رمز ترويجي",
            hintStyle: const TextStyle(
              color: Colors.grey, 
              fontSize: 14, 
              fontFamily: 'Cairo'
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xff4CAF50)),
            ),
          ),
        ),

        const SizedBox(height: 12),
        Row(
          children: [
            const Spacer(), 
            
            GestureDetector(
              onTap: () {
                context.read<CartCubit>().applyPromoCode(_promoController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "تم إرسال الطلب", 
                      textAlign: TextAlign.center, 
                      style: TextStyle(fontFamily: 'Cairo')
                    ),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xff4CAF50), 
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "تطبيق",
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo'
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}