import 'package:flutter/material.dart';
import 'package:project_axis_app/screens/home_screen.dart';
import 'package:project_axis_app/services/http_helper.dart';
import 'package:project_axis_app/services/numbers_validator.dart';

import '../main.dart';

class SecondScreen extends StatefulWidget {
  static String routeName = 'second_screen_route';

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  NumbersValidator nbValid = NumbersValidator();

  int firstNumber = 0;
  int secondNumber = 0;
  String? firstNumberErrorText;
  String? secondNumberErrorText;

  HttpHelper helper = HttpHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text('Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Input two numbers to add',
              style: TextStyle(
                fontSize: 24.0,
                color: kMainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '1st Number',
                      errorText: firstNumberErrorText,
                    ),
                    onChanged: (value) {
                      if (nbValid.isNumerical(value)) {
                        setState(() {
                          firstNumber = int.parse(value);
                          firstNumberErrorText = null;
                        });
                      } else {
                        setState(() {
                          value != ''
                              ? firstNumberErrorText = 'Numerical Only!'
                              : firstNumberErrorText = null;
                          firstNumber = 0;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '2nd Number',
                      errorText: secondNumberErrorText,
                    ),
                    onChanged: (value) {
                      if (nbValid.isNumerical(value)) {
                        setState(() {
                          secondNumber = int.parse(value);
                          secondNumberErrorText = null;
                        });
                      } else {
                        setState(() {
                          value != ''
                              ? secondNumberErrorText = 'Numerical Only!'
                              : secondNumberErrorText = null;
                          secondNumber = 0;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              '${firstNumber + secondNumber}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kMainColor),
              ),
              onPressed: () {
                //Navigator.pushNamed(context, HomeScreen.routeName);
                Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.routeName, (route) => false);
              },
              child: const Text('Back to Home'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: FutureBuilder(
                future: helper.getTrivia(firstNumber + secondNumber),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      helper.trivia,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
