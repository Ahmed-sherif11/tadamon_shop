import 'package:flutter/material.dart';

import 'package:tadamon_shop/features/notifications/presentation/views/notifications_view.dart';

import 'package:tadamon_shop/features/donations/data/models/donation_model.dart';
import 'donation_item.dart';

class DonationsViewBody extends StatelessWidget {
  DonationsViewBody({super.key});

  final List<DonationModel> donationsList = [
    DonationModel(
        name: 'جمعية الشفاء الطبية',
        phone: '5055',
        subTitle: 'للحالات الصحية',
        icon: Icons.add_box_outlined),
    DonationModel(
        name: 'مؤسسة العلم نور',
        phone: '5070',
        subTitle: 'للمشاريع التعليمية',
        icon: Icons.school_outlined),
    DonationModel(
        name: 'جمعية إيواء الخيرية',
        phone: '5099',
        subTitle: 'لدعم الأسر المحتاجة',
        icon: Icons.home_outlined),
    DonationModel(
        name: 'جمعية رعاية الأيتام',
        phone: '5033',
        subTitle: 'لكفالة ورعاية الأيتام',
        icon: Icons.sentiment_satisfied_alt_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 240,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/appbar.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NotificationsView(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 22,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'التبرعات',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo'),
                        ),
                        const Spacer(),
                        const SizedBox(width: 32),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('أرقام التواصل والتبرع',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo')),
                          SizedBox(height: 5),
                          const Text(
                              'تواصل مع المؤسسات الخيرية مباشرة عبر الأرقام الموحدة للتبرع والاستفسار',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff737373),
                                  fontFamily: 'Cairo',
                                  height: 1.4)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: donationsList.length,
              itemBuilder: (context, index) {
                return DonationItem(donation: donationsList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
