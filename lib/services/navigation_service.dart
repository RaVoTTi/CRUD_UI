import 'package:flutter/cupertino.dart';

class NavigatorService{


  static final navigatorKey = new GlobalKey<NavigatorState>();

  static navigateTo(String routeName){

    // ! te asegura que va a ir eso
    return navigatorKey.currentState!.pushNamed(routeName);
  }
  static replaceTo(String routeName){

    // ! te asegura que va a ir eso
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
  
}