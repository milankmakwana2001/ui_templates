import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_templates/business_logic/cubit/dog_jokes_cubit/dog_joke_cubit.dart';
import 'package:ui_templates/core/app_colors.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({Key? key}) : super(key: key);

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocConsumer<DogJokeCubit, DogJokeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.purple,
              ),
            );
          } else if (state is Success) {
            return Container(
              height: deviceHeight * 0.5,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                vertical: deviceHeight * 0.1,
                horizontal: deviceWidth * 0.02,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meme of the day',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceHeight * 0.02,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: deviceHeight * 0.25,
                    width: deviceWidth*0.65,
                    // color: Colors.grey,
                    child: Image.network(
                      state.apiResponses[0]['message'].toString(),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'Dog :  ${state.apiResponses[1]['setup'].toString()}',
                  ),
                  Text(
                    'Cat : ${state.apiResponses[1]['punchline'].toString()}',
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
