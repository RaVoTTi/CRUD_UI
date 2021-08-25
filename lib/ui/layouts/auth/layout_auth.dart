import 'package:flutter/material.dart';
import 'package:frontend_flutter/helpers/app_common.dart';

import 'package:frontend_flutter/ui/views/auth/view_login.dart';
import 'package:frontend_flutter/widgets/widgets.dart';

class LayoutAuth extends StatelessWidget {
  final Widget child;

  const LayoutAuth({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    print(size.height);
    print(size.width);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: AppColor.green
                ),
                Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: Colors.white),
              ],
            ),




            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.copyright,
                      color: Colors.grey,
                      size: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    FachaText(
                      title:'''Esta aplicación es desarrollada por el
Área de Investigación y desarrollo de software.''',
                      
                        color: Colors.black.withOpacity(0.8),
                        size: 14,
                        weight: FontWeight.w300,
                      
                    ),
                  ],
                ),
              ),
            ),
            this.child
          ],
        ),
      ),
    );
  }
}
