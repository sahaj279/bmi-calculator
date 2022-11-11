import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content_widget.dart';
import 'package:bmi_calculator/reusable_widget.dart';
import 'constants.dart';
import 'ans-page.dart';
import 'calculator-brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum GenderType { male, female }

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 150;
  int weight = 50;
  int age = 18;

  void updateC(GenderType gender) {
    // if (gender == GenderType.male) {
    //   if (maleC == inactiveColor) {
    //     maleC = widgetColor;
    //   } else {
    //     maleC = inactiveColor;
    //   }
    //   femaleC = inactiveColor;
    // } else {
    //   if (femaleC == inactiveColor) {
    //     femaleC = widgetColor;
    //   } else {
    //     femaleC = inactiveColor;
    //   }
    //   maleC = inactiveColor;
    // }
  }

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
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                        (selectedGender == GenderType.male)
                            ? kWidgetColor
                            : kInactiveColor,
                        IconContentWidget(FontAwesomeIcons.mars, 'MALE'), () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    }),
                  ),
                  Expanded(
                      child: ReusableContainer(
                          (selectedGender == GenderType.female)
                              ? kWidgetColor
                              : kInactiveColor,
                          IconContentWidget(FontAwesomeIcons.venus, 'FEMALE'),
                          () {
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  })),
                ],
              ),
            ),
            Expanded(
                child: ReusableContainer(
                    kWidgetColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kBigNumberStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8d8e98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayColor: Color(0x29EB1555),
                              trackHeight: 3.0,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double a) {
                              setState(() {
                                height = a.toInt();
                              });
                            },
                            min: 100.0,
                            max: 220.0,
                          ),
                        )
                      ],
                    ),
                    () {})),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      kWidgetColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            weight.toString(),
                            style: kBigNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                iconData: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                iconData: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      () {},
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      kWidgetColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            age.toString(),
                            style: kBigNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                iconData: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                iconData: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      () {},
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  CalculatorBrain cb =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AnsPage(
                      bmiVal: cb.getResult(),
                      bmiInter: cb.getInterpretation(),
                      bmiRes: cb.getTitle(),
                    );
                  }));
                },
                child: Container(
                  color: Color(0xFFeb1555),
                  width: double.infinity,
                  height: 80,
                  child: Center(
                      child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData iconData;
  final Function onpressed;
  RoundButton({this.iconData, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      focusColor: Colors.pink,
      fillColor: Color(0xFF454545),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
