import 'package:equatable/equatable.dart';
import '../data/models/donation_model.dart';

abstract class DonationsState extends Equatable {
  @override
  List<Object> get props => [];
}

class DonationsInitial extends DonationsState {}

class DonationsLoading extends DonationsState {}

class DonationsSuccess extends DonationsState {
  final List<DonationModel> donations;
  DonationsSuccess(this.donations);
  @override
  List<Object> get props => [donations];
}

class DonationsFailure extends DonationsState {
  final String errorMessage;
  DonationsFailure(this.errorMessage);
}
