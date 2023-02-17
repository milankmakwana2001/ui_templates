import 'package:flutter/material.dart';
import 'package:ui_templates/core/app_colors.dart';

import '../../core/app_strings.dart';

class DetailScreen extends StatefulWidget {
  static const pageRoute = '/detailed screen';

  DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        title: const Text(
          'Details',
        ),
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.02,
          vertical: deviceHeight * 0.015,
        ),
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.5,
          mainAxisSpacing: deviceHeight * 0.02,
          crossAxisSpacing: deviceWidth * 0.040,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Text(
              AppStrings.generateRandomString(1),
              style:
              TextStyle(color: Colors.white, fontSize: deviceHeight * 0.05),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
