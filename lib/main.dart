import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result.dart';
import 'calculator_brain.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage()

      },
    );
  }
}




