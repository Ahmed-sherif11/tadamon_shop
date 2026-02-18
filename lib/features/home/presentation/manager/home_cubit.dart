import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  
  void loadHomeData() {
    emit(HomeLoading());
    
    Future.delayed(const Duration(seconds: 1), () => emit(HomeLoaded()));
  }
}