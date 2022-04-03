import 'package:flutter/material.dart';
import 'package:project_axis_app/screens/second_screen.dart';

import '../main.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home_screen_route';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text('Project Axis App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Project Axis',
              style: TextStyle(
                fontSize: 24.0,
                color: kMainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Image(
                image: AssetImage('lib/assets/img/logo.png'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kMainColor),
              ),
              onPressed: () {
                Navigator.pushNamed(context, SecondScreen.routeName);
              },
              child: Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
