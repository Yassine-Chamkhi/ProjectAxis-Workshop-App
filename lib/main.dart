import 'package:flutter/material.dart';
import 'package:project_axis_app/screens/home_screen.dart';
import 'package:project_axis_app/screens/second_screen.dart';

Color kMainColor = Colors.blueAccent;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SecondScreen.routeName: (context) => SecondScreen(),
      },
    );
  }
}
