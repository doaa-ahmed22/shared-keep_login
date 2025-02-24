import 'package:flutter/material.dart';
import 'package:sharedtask/routes/auth.dart';
import 'package:sharedtask/routes/login.dart';
import 'package:sharedtask/screenroutes/screenroutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Auth(),
      onGenerateRoute: ScreenRoutes.GenerateRoute,
    );
  }
}
