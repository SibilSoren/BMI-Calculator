import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_container.dart';
import 'constants.dart';
import 'buttom_button.dart';
import 'calculator_brain.dart';

class ResultPage extends StatefulWidget {
  final String bmiResult;
  final String resultText;
  final String interpretationText;

  ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretationText});

  @override
  _ResultPageState createState() => _ResultPageState(bmiResult: bmiResult,resultText: resultText,interpretationText: interpretationText);
}

class _ResultPageState extends State<ResultPage> {

  final String bmiResult;
  final String resultText;
  final String interpretationText;

  _ResultPageState({@required this.bmiResult,@required this.resultText,@required this.interpretationText});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableWidget(
                  colour: kActiveColors,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(
                            color: Colors.greenAccent[400],
                            fontSize: 25,
                            letterSpacing: 1.5),
                      ),
                      Text(bmiResult,style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.w500
                      ),),
                      Text(interpretationText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.w300
                      ),)
                    ],
                  ),
                )
            ),
            Expanded(child: BottomWidget(
              label: 'RE-CALCULATE',
              onTap: (){
                Navigator.pop(context);
              },
            ))

          ],
        ));
  }
}
