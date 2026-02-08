import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/widgets/custom_page_header.dart';
import '../widgets/legal_section.dart';
import '../widgets/social_section.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // 1. تكبير الارتفاع ليعطي مساحة للصورة تظهر براحتها
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // 2. ضبط مكان العنوان داخل الخلفية
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            S.of(context).aboutApp,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        ),
        // 3. التحكم في صورة الخلفية (الإطار)
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/appbar.jpg'),
              // BoxFit.fill سيجعل الإطار يظهر بالكامل في المساحة المحددة
              fit: BoxFit.fill,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      // 4. هذا السطر هو السر في فصل المحتوى ورفعه أو تنزيله بدقة
      body: ListView(
        // تقليل الـ padding العلوي لرفع المحتوى باتجاه الإطار
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        children: [
          // مسافة دقيقة جداً للفصل بين نهاية صورة الـ AppBar وبداية النص
          const SizedBox(height: 5),

          CustomPageHeader(
            title: S.of(context).ourStory,
            subtitle: S.of(context).ourStoryContent,
          ),

          const SizedBox(height: 30), // مسافة ثابتة بين الأقسام

          CustomPageHeader(
            title: S.of(context).ourVision,
            subtitle: S.of(context).ourVisionContent,
          ),

          const SizedBox(height: 30),

          const LegalSection(),

          const SizedBox(height: 35),

          const SocialSection(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
