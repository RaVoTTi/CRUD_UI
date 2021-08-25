import 'package:flutter/material.dart';
import 'package:frontend_flutter/helpers/app_common.dart';
import 'package:frontend_flutter/providers/side_bar_provider.dart';


class NavBar extends StatefulWidget {

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Container(
      height: 40,
      
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          if (size.width <= 700 && size.width > 118)
            IconButton(
              icon: Icon(
                Icons.menu,
                color: AppColor.black,
              ),
              onPressed: (){
                SideBarProvider.openMenu();
              },
            ),
          SizedBox(width: 5,),
  
          if (size.width > 279)
          Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          
          if (size.width > 700) ...{
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                navigationIcon(icon: Icons.search),
                navigationIcon(icon: Icons.send),
                navigationIcon(icon: Icons.notifications_none_rounded),
              ],
            )
          }
        ],
      ),
    );
  }

  Widget navigationIcon({icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        color: AppColor.black,
      ),
    );
  }
}
