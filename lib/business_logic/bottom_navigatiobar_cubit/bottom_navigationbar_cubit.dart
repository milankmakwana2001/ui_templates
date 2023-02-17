import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_templates/core/app_enums.dart';

import 'bottom_navigationbar_state.dart';


class BottomNavigationbarCubit extends Cubit<BottomNavigationBarState>  {
  BottomNavigationbarCubit()
      : super(
    BottomNavigationBarState(
      BottomNavBarItem.Home,
      0,
    ),
  );

  void getBottomNavbarItem(BottomNavBarItem navBarItem) {
    switch (navBarItem) {
      case BottomNavBarItem.Home:
        emit(BottomNavigationBarState(
          BottomNavBarItem.Home,
          0,
        ));
        break;

      case BottomNavBarItem.Favourites:
        emit(BottomNavigationBarState(
          BottomNavBarItem.Favourites,
          1,
        ));
        break;

      case BottomNavBarItem.UserAccount:
        emit(BottomNavigationBarState(
          BottomNavBarItem.UserAccount,
          2,
        ));
        break;

      case BottomNavBarItem.Cart:
        emit(BottomNavigationBarState(
          BottomNavBarItem.Cart,
          3,
        ));
        break;
    }
  }
}
