import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedtask/models/used_data.dart';
import 'package:sharedtask/pref/sherd.dart';
import 'package:sharedtask/routes/welcome.dart';
import 'package:sharedtask/screenroutes/screenroutes.dart';

class Login extends StatelessWidget {
  Login({super.key});

  String userId = "${0}";
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();

  void _saveUserData() {
    String _firstname = _firstNameController.text;
    String _secondname = _secondNameController.text;
    String _email = _emailController.text;

    UserData user = UserData(
      firstName: _firstname,
      secondName: _secondname,
      email: _email,
    );

    // Increase the ID

    UserData.increaseId();

    // Store and convert the user data to Json to be stored in string

    UserSharedPreferenced.saveUserData(user);

    // Clear the controller value

    _firstNameController.clear();
    _secondNameController.clear();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to Za Zoo", style: TextStyle(fontSize: 32)),
              SizedBox(height: 20),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("First name"),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _secondNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Second name"),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  _saveUserData();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool("isLogin", true);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    ScreenRoutes.welcome,
                    (route) => false,
                  );
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
