import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tadamon_shop/features/notifications/presentation/views/notifications_view.dart';
import 'package:tadamon_shop/features/About/manager/about_bloc.dart';
import 'package:tadamon_shop/features/About/manager/about_event.dart';
import 'package:tadamon_shop/features/About/manager/about_state.dart';
import 'package:tadamon_shop/generated/l10n.dart';
import 'package:tadamon_shop/core/widgets/custom_page_header.dart';
import '../widgets/legal_section.dart';
import '../widgets/social_section.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutBloc(),
      child: Builder(builder: (context) {
        context.read<AboutBloc>().add(FetchAboutInfo(
              ourStoryTitle: S.of(context).ourStory,
              ourStoryContent: S.of(context).ourStoryContent,
              ourVisionTitle: S.of(context).ourVision,
              ourVisionContent: S.of(context).ourVisionContent,
            ));

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
                                    builder: (context) =>
                                        const NotificationsView()),
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
                  child: BlocBuilder<AboutBloc, AboutState>(
                    builder: (context, state) {
                      if (state is AboutSuccess) {
                        return Transform.translate(
                          offset: const Offset(0, -30),
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            children: [
                              ...state.sections
                                  .map((section) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 35),
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
                        );
                      }
                      return const Center(
                          child: CircularProgressIndicator(
                              color: Color(0xff27AE60)));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
