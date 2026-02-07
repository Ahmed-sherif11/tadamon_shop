import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import 'donation_item.dart';

class DonationsViewBody extends StatelessWidget {
  const DonationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      children: [
        Text(
          S.of(context).donationNumbers,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          S.of(context).donationNumbersDesc,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 25),
        DonationItem(
          title: S.of(context).alShifaMedical,
          description: S.of(context).medicalCases,
          code: "5055",
          icon: Icons.add,
        ),
        DonationItem(
          title: S.of(context).ilmNoorFoundation,
          description: S.of(context).educationProjects,
          code: "5070",
          icon: Icons.school,
        ),
        DonationItem(
          title: S.of(context).ewaCharity,
          description: S.of(context).supportingFamilies,
          code: "5099",
          icon: Icons.home,
        ),
        DonationItem(
          title: S.of(context).orphanCare,
          description: S.of(context).orphanSponsorship,
          code: "5033",
          icon: Icons.sentiment_satisfied_alt,
        ),
      ],
    );
  }
}
