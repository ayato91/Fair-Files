import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fair_files/view_model/bloc/navbarstate.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  int navIndex = 0;

  void navBarIndexChange(value) {
    navIndex = value;
    emit(NavBarItemChange());
  }
}
