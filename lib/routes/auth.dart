import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedtask/routes/login.dart';

import '../screenroutes/screenroutes.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if(IsLoggedIn) {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()),);
    // }
    check();
  }

  Future<void> check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedin = prefs.getBool("isLogin") ?? false;
    if (isLoggedin) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        ScreenRoutes.welcome,
        (route) => false,
      );
    }
  }

  Widget build(BuildContext context) {
    return Login();
  }
}
