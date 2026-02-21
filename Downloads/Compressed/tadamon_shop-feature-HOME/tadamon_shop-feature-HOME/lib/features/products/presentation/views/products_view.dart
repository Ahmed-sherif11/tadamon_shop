import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/products/presentation/widgets/filter_chip_item.dart';
import 'package:tadamon_shop/features/products/presentation/widgets/product_card.dart';
// ignore: unused_import, duplicate_import
import '../widgets/filter_chip_item.dart';
// ignore: unused_import, duplicate_import
import '../widgets/product_card.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {"n": "سماعات لاسلكية", "p": "129.99 دولارًا", "img": "assets/images/headphones.jpg"},
      {"n": "سترة جلدية", "p": "249.99 دولارًا", "img": "assets/images/jacket.jpg"},
      {"n": "مركز المنزل الذكي", "p": "199.99 دولارًا", "img": "assets/images/wifi.jpg"},
      {"n": "حبوب البن", "p": "14.99 دولارًا", "img": "assets/images/coffee.jpg"},
      {"n": "أحذية رياضية", "p": "89.99 دولارًا", "img": "assets/images/kochi.jpg"},
      {"n": "حقيبة يد", "p": "349.99 دولارًا", "img": "assets/images/bag.jpg"},
    ];

    return CustomScrollView(
      slivers: [
        
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFEBF0EB), 
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "البحث عن المنتجات",
                  prefixIcon: Icon(Icons.search, color: Color(0xFF618561)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
        ),

        
        SliverToBoxAdapter(
          child: SizedBox(
            height: 35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                FilterChipItem(label: "الجميع", ),
                FilterChipItem(label: "إلكترونيات"),
                FilterChipItem(label: "موضة"),
                FilterChipItem(label: "الرئيسية"),
              ],
            ),
          ),
        ),

        
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildSortBtn("الترتيب: الأحدث"),
                    const SizedBox(width: 12),
                    _buildSortBtn("الترتيب: شائع"),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildSortBtn("الترتيب: السعر"),
                    const SizedBox(width: 12),
                    _buildSortBtn("الترتيب: التقييم"),
                  ],
                ),
              ],
            ),
          ),
        ),

        
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
              childAspectRatio: 173 / 242,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductCard(
                name: products[index]["n"]!,
                price: products[index]["p"]!,
                imagePath: products[index]["img"]!,
              ),
              childCount: products.length,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildSortBtn(String text) {
    return Container(
      width: 131,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF0EB), 
        borderRadius: BorderRadius.circular(20), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900)),
          const Icon(Icons.keyboard_arrow_down, size: 16),
        ],
      ),
    );
  }
}