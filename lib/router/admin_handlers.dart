

import 'dart:js';

import 'package:fluro/fluro.dart';
import 'package:frontend_flutter/providers/auth_provider.dart';
import 'package:frontend_flutter/ui/views/auth/view_login.dart';
import 'package:frontend_flutter/ui/views/dashboard/view_main.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params){
    final authProvider = Provider.of<AuthProvider>(context!);
   if(authProvider.authStatus == AuthStatus.notAuthenticated)
   return LoginView();
   else 
   return MainView();
   });
}
