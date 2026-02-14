import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tadamon_shop/features/donations/data/models/donation_model.dart';

class DonationItem extends StatelessWidget {
  final DonationModel donation;

  const DonationItem({super.key, required this.donation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 107,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child:
                Icon(donation.icon, color: const Color(0xff27AE60), size: 28),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donation.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Cairo'),
                ),
                Text(
                  donation.subTitle,
                  style: const TextStyle(
                      color: Color(0xff8E8E93),
                      fontSize: 11,
                      fontFamily: 'Cairo'),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: donation.phone));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم نسخ الرقم')),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xffE9EEF2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    donation.phone,
                    style: const TextStyle(
                      color: Color(0xff27AE60),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.copy, size: 14, color: Color(0xffA0A0A0)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
