import 'package:flutter/material.dart';
import 'package:zephyr/ui/screens/login/flow_login.dart';

class AppRouter {

  static const routeLogin = '/login';

  Route<dynamic> dispatchRoute(RouteSettings settings) {
    Widget routePage;
    if (settings.name == routeLogin) {
      routePage = LoginFlow();
    } else {
      routePage = Container();
    }
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return routePage;
      },
      settings: settings,
    );
  }

}