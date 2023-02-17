import 'package:flutter/cupertino.dart';
import 'package:ui_templates/presentation/screens/detail_screen.dart';
import 'package:ui_templates/presentation/screens/home_screen.dart';

class AppRoutes{
 static Map<String , WidgetBuilder> getRoutes(){
    return {
      '/':(context)=>HomeScreen(),
      DetailScreen.pageRoute:(context)=>DetailScreen(),
    };
  }
}