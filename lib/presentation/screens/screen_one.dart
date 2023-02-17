import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:ui_templates/core/app_strings.dart';
import 'package:ui_templates/presentation/screens/detail_screen.dart';
import 'package:ui_templates/presentation/widgets/carousel_container.dart';

import '../../core/app_colors.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
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
          SizedBox(
            height: deviceHeight * 0.01,
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
          sectionContainer(
            deviceWidth,
            deviceHeight,
            wordCount: 100,
            paraCount: 2,
          ),
          sectionContainer(
            deviceWidth,
            deviceHeight,
            wordCount: 75,
            paraCount: 5,
          ),
        ],
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
        duration: const Duration(
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
        top: deviceHeight * 0.01,
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
          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: deviceHeight * 0.1,
                width: deviceWidth * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                child: Text(
                  AppStrings.generateRandomString(1),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: deviceHeight * 0.05,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: deviceWidth * 0.2,
                child: Text(
                  lorem(words: 1),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
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
            child: GestureDetector(
              // style: TextButton.styleFrom(
              //   padding: EdgeInsets.zero,
              // ),
              onTap: () {
                Navigator.of(context).pushNamed(DetailScreen.pageRoute);
              },
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
  BoxDecoration _shadowDecoration(double deviceHeight) {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.purple,
          blurRadius: deviceHeight * 0.03,
        ),
      ],
    );
  }
}
