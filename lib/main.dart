// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_templates/business_logic/cubit/Ip_address_cubit/ip_address_cubit.dart';
import 'package:ui_templates/business_logic/cubit/bottom_navigatiobar_cubit/bottom_navigationbar_cubit.dart';
import 'package:ui_templates/business_logic/cubit/carouser_cubit/carosel_cubit.dart';
import 'package:ui_templates/business_logic/cubit/dog_jokes_cubit/dog_joke_cubit.dart';
import 'business_logic/cubit/product_cubit/product_cubit.dart';


import 'package:ui_templates/business_logic/reositories/get_info_of_ip_address_repo.dart';
import 'package:ui_templates/business_logic/reositories/get_ip_address_repo.dart';
import 'package:ui_templates/business_logic/reositories/jokes_dogs_repo.dart';
import 'package:ui_templates/business_logic/reositories/product_repo.dart';
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
        ),
        RepositoryProvider(
          create: (context) => JokeDogRepo(),
        ),
        RepositoryProvider(
          create: (context) => ProductRepo(),
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
          BlocProvider<IpAddressCubit>(
            create: (context) => IpAddressCubit(
              getIpAddressRepo:
                  RepositoryProvider.of<GetIpAddressRepo>(context),
              getInfoOfIpAddressRepo:
                  RepositoryProvider.of<GetInfoOfIpAddressRepo>(context),
            ),
          ),
          BlocProvider<DogJokeCubit>(
            create: (context) => DogJokeCubit(
              dogJokRepo: RepositoryProvider.of<JokeDogRepo>(context),
            ),
          ),
          BlocProvider<ProductCubit>(
            create: (context) => ProductCubit(
              productRepo: RepositoryProvider.of<ProductRepo>(context),
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
