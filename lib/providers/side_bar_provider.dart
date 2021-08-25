import 'package:flutter/material.dart';

class SideBarProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isOpen = false;

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));
  static Animation<double> opacity = Tween<double>(begin: 0, end: 0.25)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

static void openMenu(){
  isOpen = true;
 menuController.forward(); // ejecuta la animacion 
}

static void closeMenu(){
  isOpen = false;
 menuController.reverse(); // ejecuta la animacion a la inversa 
}

}