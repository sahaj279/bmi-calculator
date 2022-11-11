import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onpressed;
  ReusableContainer(this.colour, this.cardChild, this.onpressed);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: colour),
        // height: 170.0,
        margin: EdgeInsets.all(15),
        // width: 100.0,
      ),
    );
  }
}
