import 'package:flutter/material.dart';
import 'package:frontend_flutter/helpers/app_common.dart';
import 'package:frontend_flutter/ui/layouts/dashboard/widget/nav_bar.dart';

import 'package:frontend_flutter/ui/views/dashboard/widget/calender_widget.dart';
import 'package:frontend_flutter/ui/views/dashboard/widget/notification_card_widget.dart';
import 'package:frontend_flutter/ui/views/dashboard/widget/recruitment_data_widget.dart';


class MainView extends StatefulWidget {
  
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColor.violet,);
    //   final size = MediaQuery.of(context).size;
    // return 
          /// Header Part
          
    //  Expanded(
            
    //           child: SingleChildScrollView(
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Expanded(
    //                   flex: 2,
    //                   child: Container(
    //                     child: Column(
    //                       children: [
    //                         NotificationCardWidget(),
    //                         SizedBox(
    //                           height: 20,
    //                         ),
    //                         if (size.width <= 700) ...{
    //                           CalendarWidget(),
    //                           SizedBox(
    //                             height: 20,
    //                           ),
    //                         },
    //                         // RecruitmentDataWidget(),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 if (size.width > 700)
    //                   Expanded(
    //                     child: Container(
    //                       margin: EdgeInsets.symmetric(horizontal: 10),
    //                       child: Column(
    //                         children: [
    //                           CalendarWidget(),
    //                           SizedBox(
    //                             height: 20,
    //                           ),
    //                           // ProfileCardWidget(),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
              
          
    //               ]
      
    // )
    // ),
          
    // );
  }
}
