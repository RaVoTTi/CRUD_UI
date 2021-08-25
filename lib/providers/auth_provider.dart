import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend_flutter/router/router.dart';
import 'package:frontend_flutter/services/local_storage.dart';
import 'package:frontend_flutter/services/navigation_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  void login(String email, String password) {
    // TODO: Peticion al backend

    this._token = 'asdasdasdasdasdas';
    LocalStorage.prefs.setString(
        'token', _token!); // ! cuando verificas que viene un tipo de dato

    print('El token es: $_token');
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigatorService.replaceTo(Flurorouter.dashboardRoute);

  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null || token.isEmpty) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    // TODO: ir al backend
    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
