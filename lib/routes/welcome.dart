import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedtask/models/used_data.dart';
import 'package:sharedtask/pref/sherd.dart';
import 'package:sharedtask/routes/login.dart';

import '../screenroutes/screenroutes.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool("isLogin", false);
                UserSharedPreferenced.removeUserData(UserData.userId);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ScreenRoutes.login,
                  (route) => false,
                );
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
