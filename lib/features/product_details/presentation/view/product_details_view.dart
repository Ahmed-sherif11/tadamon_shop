import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart'; 
import '../widgets/product_image.dart';
import '../widgets/product_title_price.dart';
import '../widgets/size_selector.dart';
import '../widgets/color_options.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/expandable_section.dart';
import '../widgets/bottom_add_to_cart.dart';
import '../widgets/similar_items_list.dart';

class ProductDetailsView extends StatefulWidget { 
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int quantity = 1; 
  final double unitPrice = 499.99; 

  @override
  Widget build(BuildContext context) {
    double totalPrice = unitPrice * quantity;

    return Scaffold(
      backgroundColor: Colors.white,
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
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share, color: Colors.black, size: 22),
            onPressed: () {
              Share.share(
                'شوف الساعة الرهيبة دي من تطبيق تضامن شوب! \nساعة كرونوغراف فاخرة بسعر $unitPrice دولار.\nرابط المنتج: https://tadamon-shop.com/product/123'
              );
            },
          ),
        ],
        leading: IconButton(
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
                textDirection: TextDirection.rtl,
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
                    QuantitySelector(
                      onChanged: (newQuantity) {
                        setState(() {
                          quantity = newQuantity; 
                        });
                      },
                    ),
                    
                    const SizedBox(height: 20),
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
                    const ExpandableSection(
                      title: "وصف",
                      content: "ساعة كرونوغراف فاخرة بتصميم يجمع بين الأناقة والعملية، مصنوعة من الفولاذ المقاوم للصدأ مع سير جلدي مريح يضمن لك إطلالة متميزة في كل المناسبات.",
                    ),
                    const ExpandableSection(
                      title: "تحديد",
                      content: "المادة: فولاذ مقاوم للصدأ (316L)\nمقاومة الماء: حتى 50 متر (5ATM)\nنوع الماكينة: كوارتز ياباني دقيق.",
                    ),
                    const ExpandableSection(
                      title: "مراجعات العملاء",
                      content: "⭐⭐⭐⭐⭐ (4.5/5)\nساعة ممتازة جداً وخاماتها رائعة مقارنة بالسعر. التغليف كان محكم جداً والتوصيل سريع.",
                    ),
                    const ExpandableSection(
                      title: "سياسة الشحن والإرجاع",
                      content: "شحن مجاني لكافة الطلبات. يمكنك إرجاع أو استبدال المنتج خلال 14 يومًا من تاريخ الاستلام بشرط أن يكون في حالته الأصلية.",
                    ),
                    
                    const SizedBox(height: 32),
                    const SimilarItemsList(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAddToCart(totalPrice: totalPrice),
    );
  }
}
