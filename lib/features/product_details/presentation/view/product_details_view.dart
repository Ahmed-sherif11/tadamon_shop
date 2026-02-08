import 'package:flutter/material.dart';
import '../widgets/product_image.dart';
import '../widgets/product_title_price.dart';
import '../widgets/size_selector.dart';
import '../widgets/color_options.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/expandable_section.dart';
import '../widgets/bottom_add_to_cart.dart';
import '../widgets/similar_items_list.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 👇 تعديل الـ AppBar عشان يظبط أماكن الأيقونات
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "تفاصيل المنتج",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo'),
        ),
        
        // 1. أيقونة المشاركة (هتظهر يمين الشاشة)
        actions: [
          IconButton(
            // أيقونة المشاركة الاحترافية
            icon: const Icon(Icons.ios_share, color: Colors.black, size: 22),
            onPressed: () {},
          ),
        ],

        // 2. سهم الرجوع (هتظهر شمال الشاشة)
        leading: IconButton(
          // سهم الرجوع الأنيق (بيشير لليسار في الـ RTL)
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProductImage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Directionality(
                textDirection: TextDirection.rtl, // 👈 عشان يظبط كل المحتوى يمين
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductTitlePrice(),
                    const SizedBox(height: 24),
                    const SizeSelector(),
                    const SizedBox(height: 24),
                    const Text("لون",
                        style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
                    const SizedBox(height: 12),
                    const ColorOptions(),
                    const SizedBox(height: 24),
                    const QuantitySelector(),
                    const SizedBox(height: 20),
                    
                    // نصوص التسليم باللون الأخضر الواضح
                    const Text("التسليم المقدر: 2-3 أيام عمل",
                        style: TextStyle(
                            color: Color(0xFF2E7D32),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo')),
                    const Text("تم بيعه أكثر من 500 مرة هذا الأسبوع - بقي 5 عناصر",
                        style: TextStyle(
                            color: Color(0xFF2E7D32),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo')),
                    
                    const SizedBox(height: 32),
                    const ExpandableSection(title: "وصف"),
                    const ExpandableSection(title: "تحديد"),
                    const ExpandableSection(title: "مراجعات العملاء"),
                    const ExpandableSection(title: "سياسة الشحن والإرجاع"),
                    const SizedBox(height: 32),
                    
                    // قائمة المنتجات المشابهة (صور الساعة والمحفظة)
                    const SimilarItemsList(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // الزرار والسعر الثابتين تحت
      bottomNavigationBar: const BottomAddToCart(),
    );
  }
}