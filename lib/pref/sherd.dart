import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedtask/models/used_data.dart';

class UserSharedPreferenced {
  //Save the data
/*TODO:
* Key Naming: You're using "User_${UserData.userId}", but since userId is static, it will overwrite itself.
* No Method to Retrieve Users: There is no function to get a user back from SharedPreferences.*/
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

class Preferences {
  static const String keyIsLogin = "isLoggedIn";
  static const String keyUserdata = "userData";
  static const String keyLastId = "LastId";

  Future<int> getLastId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(keyLastId) ?? 0;
  }

  Future<int> setLastId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int newId = (await getLastId()) + 1;
    await prefs.setInt(keyLastId, newId);
    return newId;
  }

  Future<void> setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(keyIsLogin, true);
    print('login is ${prefs.getBool(keyIsLogin)}');
  }

  Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('login is ${prefs.getBool(keyIsLogin)}');
    return prefs.getBool(keyIsLogin) ?? false;
  }

  Future<void> setLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(keyIsLogin, false);  print('login is ${prefs.getBool(keyIsLogin)}');
  }

  Future<void> setUserData(NewUserData user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(keyUserdata, userJson);
    print('set the $userJson user data');
  }

  Future<NewUserData?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(keyUserdata);
    if (userJson == null) return null;
print('get the $userJson user data');
    return NewUserData.fromJson(jsonDecode(userJson));
  }
  Future<void> removeUserData(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(Preferences.keyUserdata);
    print('remove the $userId user data');
  }
}
