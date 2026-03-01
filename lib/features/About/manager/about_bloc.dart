import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadamon_shop/features/About/data/models/about_model.dart';
import 'about_event.dart';
import 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial()) {
    on<FetchAboutInfo>((event, emit) {
      emit(AboutLoading());

      final sections = [
        AboutSectionModel(
            title: event.ourStoryTitle, subtitle: event.ourStoryContent),
        AboutSectionModel(
            title: event.ourVisionTitle, subtitle: event.ourVisionContent),
      ];
      emit(AboutSuccess(sections));
    });
  }
}
