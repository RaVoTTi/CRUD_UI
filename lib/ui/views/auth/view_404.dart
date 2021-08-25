import 'package:flutter/material.dart';
// import 'package:frontend_flutter/helpers/constants.dart';
import 'package:frontend_flutter/helpers/app_common.dart';
import 'package:frontend_flutter/widgets/widgets.dart';
 

class View404 extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
 Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          height: size.height *
              (size.height > 770
                  ? 0.7
                  : size.height > 670
                      ? 0.8
                      : 0.9),
          width: 500,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 100,
                        child: Image(
                            image: AssetImage('assets/image/logocum.png'))),

                    FachaText(
                      title:"Pagina no encontrada",
                      size: 18,
                      color: Colors.black,
                      weight: FontWeight.w400,
                      
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 30,
                      child: Divider(
                        color: AppColor.violet,
                        thickness: 2,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}