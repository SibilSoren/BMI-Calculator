import 'package:flutter/material.dart';
import 'constants.dart';

class BottomWidget extends StatelessWidget {
  final String label;
  final Function onTap;

  BottomWidget({this.label,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 25, letterSpacing: 1.5),
          ),
        ),
      ),
    );
  }
}
