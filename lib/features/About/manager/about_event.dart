import 'package:equatable/equatable.dart';

abstract class AboutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAboutInfo extends AboutEvent {
  final String ourStoryTitle;
  final String ourStoryContent;
  final String ourVisionTitle;
  final String ourVisionContent;

  FetchAboutInfo({
    required this.ourStoryTitle,
    required this.ourStoryContent,
    required this.ourVisionTitle,
    required this.ourVisionContent,
  });

  @override
  List<Object> get props =>
      [ourStoryTitle, ourStoryContent, ourVisionTitle, ourVisionContent];
}
