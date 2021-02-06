import 'package:flutter/material.dart';
class iconWidget extends StatelessWidget {

  final String genderText;
  final IconData genderIcon;

  iconWidget({@required this.genderIcon,@required this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(genderIcon,
          size: 100.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(genderText,style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey
        ),)
      ],

    );
  }
}
