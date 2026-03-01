import 'package:equatable/equatable.dart';

abstract class DonationsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDonationsEvent extends DonationsEvent {}
