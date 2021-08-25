import 'package:fluro/fluro.dart';
import 'package:frontend_flutter/router/admin_handlers.dart';
import 'package:frontend_flutter/router/dashboard_handler.dart';
import 'package:frontend_flutter/router/no_page_found_handler.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';

  static String loginRoute = '/autorizacion';
  // static String registerRoute = '/auth/register';

  static String dashboardRoute = '/inicio';
  static String ubicationsRoute = '/ubicaciones';
  static String noticeRoute = '/anuncios';



  
  static void configureRoutes(){

// AUTH LAYOUT
   router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
   router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);

// DASHBOARD LAYOUT
   router.define(dashboardRoute, handler: DashboardHandlers.main, transitionType: TransitionType.none);
   router.define(ubicationsRoute, handler: DashboardHandlers.ubications, transitionType: TransitionType.none);
   router.define(noticeRoute, handler: DashboardHandlers.notice, transitionType: TransitionType.none);



  router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}