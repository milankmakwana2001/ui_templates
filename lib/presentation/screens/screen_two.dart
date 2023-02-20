import 'dart:developer';

import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {

  @override
  void initState() {
    // TODO: implement initState
    log('screen 2 inited');
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    log('screen 2 disposed');
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Screen-two'),
      ),
    );
  }
}
