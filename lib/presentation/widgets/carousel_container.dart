import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_templates/business_logic/carouser_cubit/carosel_cubit.dart';
import 'package:ui_templates/core/app_strings.dart';

class CarouselContainer extends StatefulWidget {
  final double deviceHeight;
  final double deviceWidth;
  Duration? duration;
  double? height;

  CarouselContainer({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
  });

  CarouselContainer.withAutoplay({
    required this.deviceHeight,
    required this.deviceWidth,
    this.duration,
    this.height,
  });

  @override
  State<CarouselContainer> createState() => _CarouselContainerState();
}

class _CarouselContainerState extends State<CarouselContainer> {
  late PageController _pageController;
  late CarouselCubit _carouselCubit;
   Timer? _timer;

  // int activePage = 1;

  @override
  void initState() {
    // TODO: implement initState

    /**For normal Carousel**/
    if (widget.duration == null) {
      _pageController = PageController(
        viewportFraction: 1.0,
        initialPage: 0,
      );
    }

    /**For AutoSwipe Carousel**/
    if (widget.duration != null) {
      _pageController = PageController(
        viewportFraction: 1.0,
        initialPage: 0,
      );
      int _currentPage = 0;

      _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (_currentPage < 4) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_pageController.hasClients) {
            _pageController.animateToPage(
              _currentPage,
              duration: widget.duration ?? const Duration(milliseconds: 350),
              curve: Curves.easeIn,
            );
          }
        });
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _carouselCubit.close();
    _pageController.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    _carouselCubit = context.read<CarouselCubit>();
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.redAccent,
              height: widget.duration == null
                  ? widget.deviceHeight * 0.250
                  : widget.height,
              child: PageView.builder(
                controller: _pageController,
                itemCount: AppStrings.carouselImageList.length,
                onPageChanged: (page) {
                  if (widget.duration == null) {
                    _carouselCubit.changePage(page);
                  }
                },
                itemBuilder: (
                  context,
                  pagePosition,
                ) {
                  return AnimatedContainer(
                    curve: Curves.easeIn,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          AppStrings.carouselImageList[pagePosition],
                        ),
                      ),
                    ),
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  );
                },
              ),
            ),
            widget.duration != null
                ? Container()
                : Positioned(
                    right: widget.deviceWidth * 0.015,
                    left: widget.deviceWidth * 0.015,
                    top: widget.deviceHeight * 0.1,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _pageController.previousPage(
                                  duration: const Duration(
                                    milliseconds: 200,
                                  ),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: SizedBox(
                                height: widget.deviceHeight * 0.030,
                                width: widget.deviceWidth * 0.055,
                                // color: Colors.white,
                                child: SvgPicture.asset(
                                  AppStrings.leftArrow,
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _pageController.nextPage(
                                  duration: const Duration(
                                    milliseconds: 200,
                                  ),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Container(
                                height: widget.deviceHeight * 0.030,
                                width: widget.deviceWidth * 0.055,
                                // color: Colors.white,
                                child: SvgPicture.asset(
                                  AppStrings.rightArrow,
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: widget.deviceHeight * 0.1,
                        ),
                        widget.duration != null
                            ? Container()
                            : Container(
                                // color: Colors.red,
                                // width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                  horizontal: widget.deviceWidth * 0.39,
                                ),
                                child:
                                    BlocBuilder<CarouselCubit, CarouselState>(
                                  builder: (context, state) {
                                    if (state is Success) {
                                      return Row(
                                        children: indicators(
                                          AppStrings.carouselImageList.length,
                                          state.page,
                                        ),
                                      );
                                    }
                                    return Row(
                                      children: indicators(
                                        AppStrings.carouselImageList.length,
                                        0,
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(
      imagesLength,
      (index) {
        return Container(
          margin: EdgeInsets.all(3),
          width: widget.deviceWidth * 0.0169,
          height: widget.deviceHeight * 0.0078,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.white24,
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}

//Upper carousel container inside Raw without Stack
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Container(
//       height: deviceHeight * 0.030,
//       width: deviceWidth * 0.055,
//       // color: Colors.white,
//       child: SvgPicture.asset(
//         AppStrings.leftArrow,
//         fit: BoxFit.cover,
//       ),
//     ),
//         Expanded(
//           child: CarouselContainer(
//             deviceHeight: deviceHeight,
//             deviceWidth: deviceWidth,
//           ),
//         ),
//     Container(
//       height: deviceHeight * 0.030,
//       width: deviceWidth * 0.055,
//       // color: Colors.white,
//       child: SvgPicture.asset(
//         AppStrings.leftArrow,
//         fit: BoxFit.cover,
//       ),
//     ),
//   ],
// ),
