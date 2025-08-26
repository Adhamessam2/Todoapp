import 'package:flutter_bloc/flutter_bloc.dart';
import 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(const NavInitial());

  void changeTab(int index) {
    emit(NavChanged(index));
  }
}
