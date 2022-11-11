import 'package:flutter/material.dart';
import 'constants.dart';

class IconContentWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  IconContentWidget(this.iconData, this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: 80.0, color: Color(0xFF8d8e98)),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: kLabelStyle,
        )
      ],
    );
  }
}
