import 'package:flutter/material.dart';
import 'package:frontend_flutter/providers/auth_provider.dart';
import 'package:frontend_flutter/providers/side_bar_provider.dart';

import 'package:frontend_flutter/router/router.dart';
import 'package:frontend_flutter/services/local_storage.dart';
import 'package:frontend_flutter/services/navigation_service.dart';
import 'package:frontend_flutter/ui/layouts/auth/layout_auth.dart';
import 'package:frontend_flutter/ui/layouts/dashboard/layout_dashboard.dart';
import 'package:frontend_flutter/ui/layouts/loading/layout_loading.dart';
// import 'package:frontend_flutter/ui/views/dashboard/view_main.dart';
import 'package:provider/provider.dart';
// import 'package:frontend_flutter/helpers/app_common.dart';
import 'package:google_fonts/google_fonts.dart';
void main() async {
  await LocalStorage.configPrefs();
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SideBarProvider()),

        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Restful Api',

        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)), 
        // ThemeData(
        //   primaryColor: AppColor.green,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router
            .generator, // argumento route settings lo manda route settings
        // home: LayoutAuth(),
        navigatorKey: NavigatorService.navigatorKey,
        builder: (_, child) {
          // final _token = LocalStorage.prefs.getString('token');
          // print(_token);
          final authProvider = Provider.of<AuthProvider>(context);

          if (authProvider.authStatus == AuthStatus.checking) {
            return LayoutLoading();
          }
          if (authProvider.authStatus == AuthStatus.authenticated) {
            return LayoutDashboard(child: child!,);
          } else {
            return LayoutAuth(
              child: child!,
            );
          }
        });
  }
}
