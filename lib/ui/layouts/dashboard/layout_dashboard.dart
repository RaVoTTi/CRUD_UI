

import 'package:flutter/material.dart';
import 'package:frontend_flutter/helpers/app_common.dart';
import 'package:frontend_flutter/providers/side_bar_provider.dart';
import 'package:frontend_flutter/ui/layouts/dashboard/widget/nav_bar.dart';

import 'widget/side_bar.dart';

class LayoutDashboard extends StatefulWidget {
  final Widget child;

  const LayoutDashboard({Key? key, required this.child}) : super(key: key);
  @override
  _LayoutDashboardState createState() => _LayoutDashboardState();
}

class _LayoutDashboardState extends State<LayoutDashboard>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SideBarProvider.menuController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.green,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (size.width > 700) SideBar(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.bgColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        NavBar(),
                        // Expanded(
                        // child: MainView() )
                        Expanded(child: this.widget.child)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (size.width <= 700)
              AnimatedBuilder(
                  animation: SideBarProvider.menuController,
                  builder: (context, _) => Stack(
                        children: [
                          if(SideBarProvider.isOpen)
                          Opacity(
                            opacity: SideBarProvider.opacity.value, 
                            child: Container(
                              color: Colors.black,
                              width: size.width,
                              height: size.height,
                              child: GestureDetector(
                                onTap: () =>
                                  SideBarProvider.closeMenu(),
                              ),
                            ),
                          ),
                          Transform.translate(
                              offset: Offset(SideBarProvider.movement.value, 0),
                              child: SideBar()),
                        ],
                      )),
            // if (size.width >= 700)
            //       SideBar(),
          ],
        ),
      ),
    );
  }
}
