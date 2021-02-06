import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_container.dart';
import 'icon_widget.dart';
import 'constants.dart';
import 'result.dart';
import 'buttom_button.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  Color maleCardColor = kInActiveColor;
  Color femaleCardColor = kInActiveColor;
  int height=160;
  int weight=65;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('BMI Calculator'),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: ReusableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveColors
                        : kInActiveColor,
                    widget: iconWidget(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                  )),
                  Expanded(
                      child: ReusableWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveColors
                        : kInActiveColor,
                    widget: iconWidget(
                      genderText: "FEMALE",
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ))
                ],
              )),
              Expanded(
                  child: ReusableWidget(
                colour: kActiveColors,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(height.toString(), style: kNumberTextStyle),
                        Text(
                          'cm',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xffeb1555),
                        inactiveColor: Color(0xff8d8e98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                          print(newValue);
                        },
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: ReusableWidget(
                    colour: kActiveColors,
                    widget: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: FlatButton(

                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    child: Icon(Icons.remove_circle,color: Colors.white,size: 50.0)),
                              ),
                              Expanded(
                                child:FlatButton(

                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    child: Icon(Icons.add_circle,color: Colors.white,size: 50.0)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: ReusableWidget(
                    colour: kActiveColors,
                    widget: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child:FlatButton(

                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    child: Icon(Icons.remove_circle,color: Colors.white,size: 50.0)),
                              ),
                              Expanded(
                                child: FlatButton(

                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    child: Icon(Icons.add_circle,color: Colors.white,size: 50.0,)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              )),
              BottomWidget(label: 'CALCULATE',onTap: (){

                CalculatorBrain calculatorBrian = CalculatorBrain(height: height,weight: weight);

                Navigator.push(context,MaterialPageRoute(
                    builder: (context) => ResultPage(bmiResult: calculatorBrian.calculateBMI(), resultText: calculatorBrian.getResult(), interpretationText: calculatorBrian.getInterpretation())));
              },)
            ],
          )),
    );
  }
}

