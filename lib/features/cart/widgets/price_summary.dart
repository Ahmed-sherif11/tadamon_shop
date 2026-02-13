import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import '../manager/cart_cubit.dart'; 
import '../data/cart_model.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<CartProductModel>>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        final subtotal = cubit.subtotal;
        final shipping = cubit.shippingCost; 
        final total = cubit.total;

        return Column(
          children: [
            _buildPriceRow("المجموع الفرعي", "${subtotal.toStringAsFixed(2)} دولاراً"),
            const SizedBox(height: 10),
            _buildPriceRow("الشحن", "${shipping.toStringAsFixed(2)} دولاراً"),
            const SizedBox(height: 10),
            
            _buildPriceRow("الخصم", "- 10.00 دولاراً"),
            
            const Divider(height: 30, thickness: 1), 

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "الإجمالي",
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2D6A4F), 
                    fontFamily: 'Cairo', 
                  ),
                ),
                Text(
                  "${total.toStringAsFixed(2)} دولاراً", 
                  style: const TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildPriceRow(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'Cairo')),
        Text(price, style: const TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'Cairo')),
      ],
    );
  }
}