import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  static HomeCubit? homeCubit;
  void moveInPage(int pageIndex) {
    emit(
      state.copyWith(
        getSellectIndexBottomBar: pageIndex,
      ),
    );
  }
}
