// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_templates/business_logic/bottom_navigatiobar_cubit/bottom_navigationbar_cubit.dart';
import 'package:ui_templates/business_logic/carouser_cubit/carosel_cubit.dart';
import 'package:ui_templates/core/app_colors.dart';
import 'package:ui_templates/core/app_enums.dart';
import 'package:ui_templates/core/app_strings.dart';
import 'package:ui_templates/presentation/screens/screen_four.dart';
import 'package:ui_templates/presentation/screens/screen_one.dart';
import 'package:ui_templates/presentation/screens/screen_three.dart';
import 'package:ui_templates/presentation/screens/screen_two.dart';

import '../../business_logic/bottom_navigatiobar_cubit/bottom_navigationbar_state.dart';

class HomeScreen extends StatefulWidget {
  static const pageRoute = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ui template',
          ),
          backgroundColor: AppColors.purple,
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationbarCubit, BottomNavigationBarState>(
          builder: (context, state) {
            return Container(
              height: deviceHeight * 0.0837,
              width: double.infinity,
              child: Wrap(
                children: [
                  BottomNavigationBar(
                    iconSize: deviceHeight * 0.0267,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    currentIndex: state.index,
                    type: BottomNavigationBarType.fixed,
                    onTap: (index) {
                      if (index == 0) {
                        BlocProvider.of<BottomNavigationbarCubit>(context)
                            .getBottomNavbarItem(BottomNavBarItem.Home);

                        // BlocProvider.of<CarouselCubit>(context).changePage(0);
                      } else if (index == 1) {
                        BlocProvider.of<BottomNavigationbarCubit>(context)
                            .getBottomNavbarItem(BottomNavBarItem.Favourites);
                        BlocProvider.of<CarouselCubit>(context).changePage(0);
                      } else if (index == 2) {
                        BlocProvider.of<BottomNavigationbarCubit>(context)
                            .getBottomNavbarItem(BottomNavBarItem.UserAccount);
                        BlocProvider.of<CarouselCubit>(context).changePage(0);
                      } else if (index == 3) {
                        BlocProvider.of<BottomNavigationbarCubit>(context)
                            .getBottomNavbarItem(BottomNavBarItem.Cart);
                        BlocProvider.of<CarouselCubit>(context).changePage(0);
                      }
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Container(
                          // height: _deviceHeight*0.0267,
                          // width: _deviceWidth*0.0579,
                          child: SvgPicture.asset(
                            AppStrings.homeIcon,
                          ),
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AppStrings.favouriteIcon,
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AppStrings.userAccountIcon,
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AppStrings.cartIcon,
                        ),
                        label: '',
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
        body: BlocBuilder<BottomNavigationbarCubit, BottomNavigationBarState>(
          builder: (context, state) {
            if (state.navigationBarItem == BottomNavBarItem.Home) {
              return ScreenOne();
            } else if (state.navigationBarItem == BottomNavBarItem.Favourites) {
              return ScreenTwo();
            } else if (state.navigationBarItem ==
                BottomNavBarItem.UserAccount) {
              return ScreenThree();
            } else if (state.navigationBarItem == BottomNavBarItem.Cart) {
              return ScreenFour();
            } else {
              return Container();
            }
          },
        ));
  }
}
