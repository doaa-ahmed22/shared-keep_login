import 'package:flutter/material.dart';
import 'package:sharedtask/routes/login.dart';
import 'package:sharedtask/routes/welcome.dart';

class ScreenRoutes {
  static const String login = "/";
  static const String welcome = "/welcome";

  static Route<dynamic>? GenerateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case ScreenRoutes.login:
        return MaterialPageRoute(builder: (context) => Login());
      case ScreenRoutes.welcome:
        return MaterialPageRoute(builder: (context) => Welcome());
    }
    return null;
  }
}
