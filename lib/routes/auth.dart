import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedtask/pref/sherd.dart';
import 'package:sharedtask/routes/login.dart';
import 'package:sharedtask/routes/welcome.dart';

import '../screenroutes/screenroutes.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  /*
  * TODO:
  *  Navigation inside initState(): Using Navigator directly in initState() can cause issues.
  *  Instead, use Future.delayed().*/
  // void initState() {
  //   super.initState();

  //     checkFunction();

  // }

  checkFunction() async {
    Preferences pref = Preferences();
    bool isLoggedIn = await pref.getLogin();
    if (mounted) {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, ScreenRoutes.welcome);
        print("Logged in");
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          ScreenRoutes.login,
              (route) => false,
        );
        print("Not Logged in");
      }
    }
  }


  // Future<void> check() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isLoggedin = prefs.getBool("isLogin") ?? false;
  //   if (isLoggedin) {
  //     Navigator.pushNamedAndRemoveUntil(
  //       context,
  //       ScreenRoutes.welcome,
  //       (route) => false,
  //     );
  //   }
  // }
/*
* TODO:
  if you want to call login screen why should you use initState()?!!!!!!!!!!!!!*/
  @override
  Widget build(BuildContext context) {
    // return Login();
    return Scaffold(
      body: Login(),
    );
  }
}
