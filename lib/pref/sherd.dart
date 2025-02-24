import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedtask/models/used_data.dart';

class UserSharedPreferenced {
  //Save the data

  static Future<void> saveUserData(UserData user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString("User_${UserData.userId}", userJson);
    print(prefs.getString("User_${UserData.userId}"));
  }

  //Remove the data

  static Future<void> removeUserData(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("User_${UserData.userId}");
    print(prefs.getString("User_${UserData.userId}"));
  }
}
