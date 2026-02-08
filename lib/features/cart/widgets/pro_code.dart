import 'package:flutter/material.dart';

class ProCodeWidget extends StatelessWidget {
  const ProCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: const Text(
            "رمز ترويجي",
            textAlign: TextAlign.right, 
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),

        const SizedBox(height: 12), 

        
        Directionality(
          textDirection: TextDirection.ltr, 
          child: Row(
            children: [
              
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff4CAF50), 
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "تطبيق",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(), 
            ],
          ),
        ),
      ],
    );
  }
}