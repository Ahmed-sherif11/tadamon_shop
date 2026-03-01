import 'package:equatable/equatable.dart';
import 'package:tadamon_shop/features/About/data/models/about_model.dart';

abstract class AboutState extends Equatable {
  @override
  List<Object> get props => [];
}

class AboutInitial extends AboutState {}

class AboutLoading extends AboutState {}

class AboutSuccess extends AboutState {
  final List<AboutSectionModel> sections;
  AboutSuccess(this.sections);

  @override
  List<Object> get props => [sections];
}
