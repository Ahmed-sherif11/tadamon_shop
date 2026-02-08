import 'package:flutter/material.dart';

class DonationsView extends StatelessWidget {
  const DonationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/appbar.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "التبرعات",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ),
            ),
            ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 50),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ارقام التواصل والتبرع",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "تواصل مع المؤسسات الخيريه مباشره عبر الارقام الموحده للتبرع او الاستفسار",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildDonationCard("جمعية الشفاء الطبيه",
                          "للحالات الصحية", "5055", Icons.add_box_outlined),
                      _buildDonationCard("مؤسسة العلم نور",
                          "للمشاريع التعليميه", "5070", Icons.school_outlined),
                      _buildDonationCard("جمعية ايواء الخيريه",
                          "لدعم الاسر المحتاجه", "5099", Icons.home_outlined),
                      _buildDonationCard(
                          "جمعية رعاية الايتام",
                          "لكفالة ورعاية الايتام",
                          "5033",
                          Icons.sentiment_satisfied_alt_outlined),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 40,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    size: 20, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationCard(
      String title, String subtitle, String number, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Icon(icon, color: const Color(0xFF2E7D32), size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Cairo')),
                Text(subtitle,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 11, fontFamily: 'Cairo')),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
                color: const Color(0xFFEBEEF0),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const Icon(Icons.copy_all, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(number,
                    style: const TextStyle(
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.bold,
                        fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
