import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_templates/business_logic/Ip_address_cubit/ip_address_cubit.dart';
import 'package:ui_templates/business_logic/models/get_info_of_ip_address_repo_model.dart';
import 'package:ui_templates/core/app_colors.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<IpAddressCubit, IpAddressState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.purple,
              ),
            );
          } else if (state is Success) {
            log(state.ipInfo.country.toString());
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.02,
                // vertical: deviceHeight * 0.2,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Secret Info',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceHeight * 0.03,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      top: deviceHeight*0.02
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ip : ${state.ipInfo.ip.toString()}'),
                        Text('city : ${state.ipInfo.city.toString()}'),
                        Text('region : ${state.ipInfo.region.toString()}'),
                        Text('country : ${state.ipInfo.country.toString()}'),
                        Text('org : ${state.ipInfo.org.toString()}'),
                        Text('postal : ${state.ipInfo.postal.toString()}'),
                        // Text('ip : ${state.ipInfo.ip.toString()}'),
                        // Text('ip : ${state.ipInfo.ip.toString()}'),
                        // Text('ip : ${state.ipInfo.ip.toString()}'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
        listener: (context, state) {},
      ),
    );
  }
}
