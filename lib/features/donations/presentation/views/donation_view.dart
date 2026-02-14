import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/donations/presentation/widgets/donations_view_body.dart';

class DonationView extends StatelessWidget {
  const DonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DonationsViewBody(),
    );
  }
}
