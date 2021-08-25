import 'package:flutter/material.dart';
import 'package:frontend_flutter/helpers/app_common.dart';
import 'package:frontend_flutter/providers/side_bar_provider.dart';
import 'package:frontend_flutter/router/router.dart';
import 'package:frontend_flutter/services/navigation_service.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: AppColor.green,
      child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "CRUD APP-MUNI",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DrawerListTile(
              title: "Inicio",
              icon: "assets/image/menu_home.png",
              function: () {
                print('Inicio');
                SideBarProvider.closeMenu();
                NavigatorService.navigateTo(Flurorouter.dashboardRoute);
              },
            ),
            DrawerListTile(
                title: "Anuncios",
                icon: "assets/image/send.png",
                function: () {
                  print('Anuncios');
                  SideBarProvider.closeMenu();
                  NavigatorService.navigateTo(Flurorouter.noticeRoute);
                  
                }),
            DrawerListTile(
              title: "Ubicaciones",
              icon: "assets/image/send.png",
              function: () {
                print('Ubicaciones');
                SideBarProvider.closeMenu();
                NavigatorService.navigateTo(Flurorouter.ubicationsRoute);
              },
            ),
            DrawerListTile(
              title: "Servicios",
              icon: "assets/image/send.png",
              function: () {
                SideBarProvider.closeMenu();
                print('Servicios');
              },
            ),
            DrawerListTile(
              title: "Drawer",
              icon: "assets/image/send.png",
              function: () {

                print('Drawer');
              SideBarProvider.closeMenu();
              },
            ),
            SizedBox(height: 40),
            DrawerListTile(
              title: "Salir",
              icon: "assets/image/more.png",
              function: () {
                SideBarProvider.closeMenu();
                print('Salir');
              },
            ),
            Spacer(),
            Image.asset("assets/image/sidebar_image.png")
          ],
        ),
      
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, icon;
  final VoidCallback function; // when it don't return something

  const DrawerListTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        icon,
        color: AppColor.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
