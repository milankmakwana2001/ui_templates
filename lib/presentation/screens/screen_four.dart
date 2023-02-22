import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:ui_templates/business_logic/product_cubit/product_cubit.dart';
import 'package:ui_templates/core/app_colors.dart';

class ScreenFour extends StatefulWidget {
  const ScreenFour({Key? key}) : super(key: key);

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
  ScrollController scrollController = ScrollController();
  late ProductCubit _productCubit;

  @override
  void initState() {
    // TODO: implement initState

    _productCubit = context.read<ProductCubit>();
    _productCubit.getData();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Random random = new Random();
        int randomNumber = random.nextInt(5);
        _getMoreData(randomNumber);
      }
    });
    super.initState();
  }

  _getMoreData(int pageNum) {
    _productCubit.getData();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.purple,
              ),
            );
          } else if (state is Success) {
            return ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.symmetric(
                vertical: deviceHeight * 0.02,
                horizontal: deviceWidth * 0.015,
              ),
              physics: BouncingScrollPhysics(),
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                          // state.data[index],
                          (index + 1).toString()),
                    ),
                    title: Text(
                        // lorem(
                        //   words: 1,
                        // ),
                        state.data[index].title.toString()),
                    subtitle: Text(
                      lorem(
                        paragraphs: 1,
                        words: 50,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
