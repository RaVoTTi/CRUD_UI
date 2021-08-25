import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:frontend_flutter/providers/auth_provider.dart';
import 'package:frontend_flutter/ui/views/auth/view_login.dart';

import 'package:frontend_flutter/ui/views/dashboard/view_main.dart';
import 'package:frontend_flutter/ui/views/dashboard/view_notice.dart';
import 'package:frontend_flutter/ui/views/dashboard/view_ubications.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler main = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return MainView();
    } else {
      return LoginView();
    }
  });

  static Handler ubications = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return UbicationsView();
    } else {
      return LoginView();
    }
  });
    static Handler notice = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return NoticeView();
    } else {
      return LoginView();
    }
  });
}
