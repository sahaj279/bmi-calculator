import 'package:flutter/material.dart';

import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  CalculatorBrain({this.height, this.weight});

  double _bmi;
  String getResult() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(
        1); //double value gets rounded of and only 1 num is printed after decimal
  }

  String getTitle() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Control your diet and start exercising fatty.';
    } else if (_bmi > 18.5) {
      return 'Wow! Your BMI is perfect!\nGood Job!';
    } else {
      return 'Like everyone says, why don\'t you eat anything!';
    }
  }
}
