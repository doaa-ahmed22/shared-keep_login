import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedtask/models/used_data.dart';
import 'package:sharedtask/pref/sherd.dart';
import 'package:sharedtask/routes/login.dart';

import '../screenroutes/screenroutes.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  // Preferences pref = Preferences();
  //
  // void removeUserData(String userId) async {
  //   await pref.removeUserData(userId);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.setBool("isLogin", false);
                // UserSharedPreferenced.removeUserData(UserData.userId);

                Preferences pref = Preferences();
                NewUserData? userData = await pref.getUserData();
                if(userData != null){
                  await pref.removeUserData(userData.userId);
                }
                await pref.setLogout();

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  ScreenRoutes.login,
                  (route) => false,
                );
              },
              child: Text("Logout"),
            ),

            ElevatedButton(
              onPressed: () async {
                Preferences pref = Preferences();
 await pref.getUserData();
 await pref.getLogin();

              },
              child: Text("get user data"),
            ),
          ],
        ),
      ),
    );
  }
}
