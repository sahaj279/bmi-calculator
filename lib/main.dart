import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        // splashColor: Color(0xFF090c22),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Color(0xFF080c1f),
      ),
      home: InputPage(),
    );
  }
}
