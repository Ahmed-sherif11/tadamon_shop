import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/chatbot/presentation/views/chat_view.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/widgets/custom_page_header.dart';
import '../widgets/legal_section.dart';
import '../widgets/social_section.dart';

class AboutSectionModel {
  final String title;
  final String subtitle;
  AboutSectionModel({required this.title, required this.subtitle});
}

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AboutSectionModel> aboutSections = [
      AboutSectionModel(
        title: S.of(context).ourStory,
        subtitle: S.of(context).ourStoryContent,
      ),
      AboutSectionModel(
        title: S.of(context).ourVision,
        subtitle: S.of(context).ourVisionContent,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 210,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/appbar.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 15,
                  left: 15,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            size: 22, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatView(),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            S.of(context).aboutApp,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -30),
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    ...aboutSections
                        .map((section) => Padding(
                              padding: const EdgeInsets.only(bottom: 35),
                              child: CustomPageHeader(
                                title: section.title,
                                subtitle: section.subtitle,
                              ),
                            ))
                        .toList(),
                    const LegalSection(),
                    const SizedBox(height: 40),
                    const SocialSection(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
