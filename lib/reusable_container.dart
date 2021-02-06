import 'package:bmi_app/input_page.dart';
import 'package:flutter/material.dart';
class ReusableWidget extends StatelessWidget {

  ReusableWidget({@required this.colour,this.widget,this.onPress});
  final Color colour;
  final Widget widget;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: widget,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}