// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_templates/business_logic/Ip_address_cubit/ip_address_cubit.dart';
import 'package:ui_templates/business_logic/bottom_navigatiobar_cubit/bottom_navigationbar_cubit.dart';
import 'package:ui_templates/business_logic/carouser_cubit/carosel_cubit.dart';
import 'package:ui_templates/business_logic/reositories/get_info_of_ip_address_repo.dart';
import 'package:ui_templates/business_logic/reositories/get_ip_address_repo.dart';
import 'package:ui_templates/core/app_routes.dart';
import 'package:ui_templates/presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => GetIpAddressRepo(),
        ),
        RepositoryProvider(
          create: (context) => GetInfoOfIpAddressRepo(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CarouselCubit>(
            create: (context) => CarouselCubit(),
          ),
          BlocProvider<BottomNavigationbarCubit>(
            create: (context) => BottomNavigationbarCubit(),
          ),
          BlocProvider(
            create: (context) => IpAddressCubit(
              getIpAddressRepo:
                  RepositoryProvider.of<GetIpAddressRepo>(context),
              getInfoOfIpAddressRepo:
                  RepositoryProvider.of<GetInfoOfIpAddressRepo>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Ui template',
          initialRoute: HomeScreen.pageRoute,
          debugShowCheckedModeBanner: false,
          routes: AppRoutes.getRoutes(),
        ),
      ),
    );
  }
}
