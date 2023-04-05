import 'package:calculator_project/Basic_cal/widget/calculator_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  int firstnum = 0;
  int secondnum = 0;
  String history = '';
  String texttoDisplay = '';
  String result = '';
  String operation = '';
  
  //Condition of a Calculator
  void btnOnClick(String btn_val){
    print(btn_val);
    if(btn_val == 'C')
    {
      texttoDisplay = '';
      firstnum = 0;
      secondnum = 0;
      result = '';
    } else if(btn_val == 'AC')
    {
      texttoDisplay = '';
      firstnum = 0;
      secondnum = 0;
      result = '';
      history = '';
    }
    else if(btn_val == '+' || btn_val == '-' || btn_val == '/' || btn_val == 'x')
    {
      firstnum = int.parse(texttoDisplay);
      result = '';
      operation = btn_val;
    }else if(btn_val == '+/-'){
      if( texttoDisplay[0] != '-'){
        result = '-' + texttoDisplay;
      }else{
        result = texttoDisplay.substring(1);
      }
    }else if(btn_val == '<'){
      result = texttoDisplay.substring(0, texttoDisplay.length - 1);
    }
    else if(btn_val == '='){
      secondnum = int.parse(texttoDisplay);
      if( operation == '+')
      {
        result = (firstnum + secondnum).toString();
        history = firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if( operation == '-')
      {
        result = (firstnum - secondnum).toString();
        history = firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if( operation == 'x')
      {
        result = (firstnum * secondnum).toString();
        history = firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if( operation == '/')
      {
        result = (firstnum / secondnum).toString();
        history = firstnum.toString() + operation.toString() + secondnum.toString();
      }
    }
    else{
      result = int.parse(texttoDisplay + btn_val).toString();
    }

    setState(() {
      texttoDisplay = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Calculator'),
          centerTitle: true
        ),
        backgroundColor: Color(0xFF28527a),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Output Display
              Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color(0x66FFFFFF),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              //Input Display
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    texttoDisplay,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ),
                  alignment: Alignment(1.0, 1.0),
              ),
              //Button design
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Calc_Button('AC', 0xFF8ac4d0, 0xFF000000, 20, btnOnClick),
                 Calc_Button('C', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('<', 0xFFf4d160, 0xFF000000, 24, btnOnClick),
                 Calc_Button('/', 0xFFf4d160, 0xFF000000, 24, btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Calc_Button('9', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('8', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('7', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('x', 0xFFf4d160, 0xFF000000, 24, btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Calc_Button('6', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('5', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('4', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('-', 0xFFf4d160, 0xFF000000, 24, btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Calc_Button('3', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('2', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('1', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('+', 0xFFf4d160, 0xFF000000, 24, btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Calc_Button('+/-', 0xFF8ac4d0, 0xFF000000, 22, btnOnClick),
                 Calc_Button('0', 0xFF8ac4d0, 0xFF000000, 24, btnOnClick),
                 Calc_Button('00', 0xFF8ac4d0, 0xFF000000, 22, btnOnClick),
                 Calc_Button('=', 0xFFf4d160, 0xFF000000, 24, btnOnClick),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}