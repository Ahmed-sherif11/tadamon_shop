import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadamon_shop/features/donations/manager/donations_bloc.dart';
import 'package:tadamon_shop/features/donations/manager/donations_event.dart';

import '../widgets/donations_view_body.dart';

class DonationView extends StatelessWidget {
  const DonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DonationsBloc()..add(FetchDonationsEvent()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: DonationsViewBody(),
      ),
    );
  }
}
