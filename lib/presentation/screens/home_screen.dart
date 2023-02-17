// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:ui_templates/core/app_colors.dart';
import 'package:ui_templates/core/app_strings.dart';
import 'package:ui_templates/presentation/widgets/carousel_container.dart';

class HomeScreen extends StatefulWidget {
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CarouselContainer(
              deviceHeight: deviceHeight,
              deviceWidth: deviceWidth,
            ),
            customTitleContainer(
              deviceWidth,
              deviceHeight,
            ),
            customHorizontalScrollContainer(
              deviceWidth,
              deviceHeight,
            ),
            customTitleContainer(
              deviceWidth,
              deviceHeight,
            ),
            customHorizontalScrollContainer(
              deviceWidth,
              deviceHeight,
            ),
            adsContainer(
              deviceHeight,
              deviceWidth,
            ),
            sectionContainer(deviceWidth, deviceHeight,
                wordCount: 100, paraCount: 2),
            sectionContainer(
              deviceWidth,
              deviceHeight,
              wordCount: 75,
              paraCount: 5,
            ),
          ],
        ),
      ),
    );
  }

  Container sectionContainer(
    double deviceWidth,
    double deviceHeight, {
    required int wordCount,
    required int paraCount,
  }) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: deviceWidth * 0.015,
        right: deviceWidth * 0.015,
        bottom: deviceHeight * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: deviceHeight * 0.002,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              lorem(words: 1),
              style: TextStyle(
                fontSize: deviceHeight * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              lorem(
                words: wordCount,
                paragraphs: paraCount,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container adsContainer(double deviceHeight, double deviceWidth) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: deviceHeight * 0.015,
        horizontal: deviceWidth * 0.015,
      ),
      color: Colors.blueAccent,
      width: double.infinity,
      height: deviceHeight * 0.15,
      child: CarouselContainer.withAutoplay(
        deviceHeight: deviceHeight,
        deviceWidth: deviceWidth,
        duration: Duration(
          milliseconds: 500,
        ),
        height: deviceHeight * 0.15,
      ),
    );
  }

  Container customHorizontalScrollContainer(
      double deviceWidth, double deviceHeight) {
    return Container(
      margin: EdgeInsets.only(
        left: deviceWidth * 0.02,
        right: deviceWidth * 0.02,
      ),
      width: double.infinity,
      height: deviceHeight * 0.13,
      // color: Colors.grey,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            // height: deviceHeight * 0.02,
            width: deviceWidth * 0.2,

            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
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
        separatorBuilder: (context, index) {
          return SizedBox(
            width: deviceWidth * 0.02,
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Container customTitleContainer(double deviceWidth, double deviceHeight) {
    return Container(
      margin: EdgeInsets.only(
        left: deviceWidth * 0.02,
        right: deviceWidth * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              lorem(
                words: 1,
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: deviceHeight * 0.025,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Text(
                'View more',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: deviceHeight * 0.018,
                  color: AppColors.purple,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
