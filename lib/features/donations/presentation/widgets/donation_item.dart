import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DonationItem extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final IconData icon;

  const DonationItem({
    super.key,
    required this.title,
    required this.description,
    required this.code,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: code));

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("تم نسخ الرقم بنجاح"),
                    duration: Duration(seconds: 1)),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.copy, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    code,
                    style: const TextStyle(
                      color: Color(0xFF27AE60),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'Cairo',
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE0E0E0)),
              color: Colors.white,
            ),
            child: Icon(icon, color: const Color(0xFF27AE60), size: 24),
          ),
        ],
      ),
    );
  }
}
