import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../data/models/donation_model.dart';
import 'donations_event.dart';
import 'donations_state.dart';

class DonationsBloc extends Bloc<DonationsEvent, DonationsState> {
  DonationsBloc() : super(DonationsInitial()) {
    on<FetchDonationsEvent>((event, emit) async {
      emit(DonationsLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));

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

        emit(DonationsSuccess(donationsList));
      } catch (e) {
        emit(DonationsFailure("عذراً، فشل تحميل بيانات التبرعات"));
      }
    });
  }
}
