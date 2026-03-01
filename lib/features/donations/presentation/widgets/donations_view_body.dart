import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadamon_shop/features/donations/manager/donations_bloc.dart';
import 'package:tadamon_shop/features/donations/manager/donations_state.dart';
import 'package:tadamon_shop/features/notifications/presentation/views/notifications_view.dart';
import 'donation_item.dart';

class DonationsViewBody extends StatelessWidget {
  const DonationsViewBody({super.key});

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
                          child: const Icon(Icons.arrow_back_ios,
                              size: 22, color: Colors.black),
                        ),
                        const Spacer(),
                        const Text(
                          'التبرعات',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
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
                          Text(
                            'أرقام التواصل والتبرع',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          Text(
                            'تواصل مع المؤسسات الخيرية مباشرة للتبرع والاستفسار',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff737373),
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<DonationsBloc, DonationsState>(
              builder: (context, state) {
                if (state is DonationsSuccess) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    itemCount: state.donations.length,
                    itemBuilder: (context, index) {
                      return DonationItem(donation: state.donations[index]);
                    },
                  );
                } else if (state is DonationsFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: const TextStyle(fontFamily: 'Cairo'),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xff27AE60)),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
