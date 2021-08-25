import 'package:fluro/fluro.dart';
import 'package:frontend_flutter/ui/views/auth/view_404.dart';


class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, params) 
  => View404());
}
