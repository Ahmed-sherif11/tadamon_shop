import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  
  final Color figmaGreen = const Color(0xFF618561);
  
  
  final Color lightBackgroundGreen = const Color(0xFFEBF0EB);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: lightBackgroundGreen, 
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "البحث عن المنتجات أو العلامات التجارية",
                  hintStyle: const TextStyle(fontSize: 13, color: Colors.black54),
                  prefixIcon: Icon(Icons.search, color: figmaGreen), 
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ),
          ),

          
          SizedBox(
            height: 195,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                _buildBanner("assets/images/plante.jpg", "بيع الصيف", "خصم يصل إلى 50%"),
                _buildBanner("assets/images/chair2.jpg", "منتجات جديدة", "تسوق أحدث المنتجات"),
                _buildBanner("assets/images/bathtub.jpg", "تخفيضات سريعة", "لفترة محدودة فقط"),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text("الفئات", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ),

          
          _buildCategories(),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Text("منتجات قد تعجبك", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          ),

          // 4. قسم المنتجات
          _buildProducts(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildBanner(String img, String title, String sub) {
    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(img, height: 135, width: 280, fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(sub, style: TextStyle(color: figmaGreen, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    final cats = [
      {"n": "أثاث", "i": Icons.chair_outlined},
      {"n": "ديكور", "i": Icons.eco_outlined},
      {"n": "إضاءة", "i": Icons.lightbulb_outline},
      {"n": "ملابس", "i": Icons.checkroom_outlined},
      {"n": "مطبخ", "i": Icons.kitchen_outlined},
      {"n": "حمام", "i": Icons.bathtub_outlined},
    ];
    return SizedBox(
      height: 42,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cats.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: lightBackgroundGreen, 
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                
                Icon(
                  cats[i]['i'] as IconData,
                  color: Colors.black, 
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  cats[i]['n'] as String, 
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProducts() {
    final prods = [
      {"t": "أريكة مريحة", "p": "499 دولار", "img": "assets/images/sofa.jpg"},
      {"t": "الإضاءة المحيطة", "p": "129 دولار", "img": "assets/images/lamp.jpg"},
      {"t": "أناقة تناول الطعام", "p": "799 دولار", "img": "assets/images/cha.jpg"},
      {"t": "سرير حالم", "p": "950 دولار", "img": "assets/images/bad.jpg"},
    ];
    return SizedBox(
      height: 275,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: prods.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, i) => Container(
          width: 160,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(prods[i]['img']!, height: 210, width: 160, fit: BoxFit.cover),
              ),
              const SizedBox(height: 6),
              Text(prods[i]['t']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text(prods[i]['p']!, style: TextStyle(color: figmaGreen, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}