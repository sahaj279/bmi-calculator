import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_widget.dart';
import 'constants.dart';

class AnsPage extends StatelessWidget {
  final String bmiVal;
  final String bmiRes;
  final String bmiInter;

  AnsPage(
      {@required this.bmiVal, @required this.bmiRes, @required this.bmiInter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(8),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableContainer(
                  kWidgetColor,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bmiRes,
                        style: TextStyle(
                          color: Color(0xff24d876),
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        bmiVal,
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        bmiInter,
                        style: TextStyle(fontSize: 22.0),
                      )
                    ],
                  ),
                  () {}),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Color(0xFFeb1555),
                  width: double.infinity,
                  height: 80,
                  child: Center(
                      child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
                ))
          ],
        )));
  }
}
