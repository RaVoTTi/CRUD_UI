import 'package:flutter/material.dart';

class LayoutLoading extends StatelessWidget {
  const LayoutLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
        "assets/image/facha.gif",
      ),
      ),
    );
  }
}